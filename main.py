from __future__ import annotations

import argparse
import logging
import os
import platform
from pathlib import Path

if platform.system() == "Darwin":
    # FAISS + sentence-transformers/torch can load duplicate libomp on macOS.
    # Set before importing either dependency to prevent process abort.
    os.environ.setdefault("KMP_DUPLICATE_LIB_OK", "TRUE")

from config import settings
from src.ingestion.bm25_loader import load_bm25_retriever
from src.ingestion.bm25_index import BM25Retriever
from src.llm.langchain_client import LangChainLLM
from src.rag.engine import RAGSQLEngine
from src.rag.sql_generator import SQLGenerator
from src.rag.sql_validator import SQLValidator
from src.rag.types import ContextBudgets
from src.retrieval.context_builder import ContextBuilder
from src.retrieval.hybrid_retriever import HybridRetriever
from src.retrieval.query_context import QueryUnderstanding
from src.retrieval.reranker import ReRanker
from src.retrieval.retrieval_pipeline import RetrievalPipeline
from src.retrieval.vector_retriever import VectorRetriever
from src.utils.loaders import load_json_file
from src.utils.logging import configure_logging

logger = logging.getLogger(__name__)


def _load_bm25_with_fallback(
    payload_path: Path,
    fallback_chunks_path: Path,
    source_store: str,
) -> BM25Retriever:
    """
    Load BM25 retriever from persisted payload and fallback to chunk JSON if missing.
    """
    try:
        return load_bm25_retriever(payload_path, source_store=source_store)
    except FileNotFoundError:
        if not fallback_chunks_path.exists():
            raise FileNotFoundError(
                f"BM25 payload missing at {payload_path} and fallback chunks missing at "
                f"{fallback_chunks_path}. Run: python -m src.ingestion.pipeline"
            )
        logger.warning(
            "BM25 payload missing at %s. Falling back to in-memory BM25 from %s",
            payload_path,
            fallback_chunks_path,
        )
        chunks = load_json_file(fallback_chunks_path)
        if not isinstance(chunks, list) or not chunks:
            raise ValueError(
                f"Invalid fallback chunk data at {fallback_chunks_path}. "
                "Run: python -m src.ingestion.pipeline"
            )
        return BM25Retriever(documents=chunks, source_store=source_store)


def build_engine() -> RAGSQLEngine:
    configure_logging(settings.LOG_LEVEL)

    sql_vector = VectorRetriever(Path(settings.SQL_VECTOR_INDEX_PATH), source_store="sql")
    business_vector = VectorRetriever(
        Path(settings.BUSINESS_VECTOR_INDEX_PATH),
        source_store="business",
    )

    sql_bm25 = _load_bm25_with_fallback(
        payload_path=Path(settings.SQL_BM25_PATH),
        fallback_chunks_path=Path("data/chunks/sql_chunks.json"),
        source_store="sql",
    )
    business_bm25 = _load_bm25_with_fallback(
        payload_path=Path(settings.BUSINESS_BM25_PATH),
        fallback_chunks_path=Path("data/chunks/business_chunks.json"),
        source_store="business",
    )

    sql_hybrid = HybridRetriever(sql_vector, sql_bm25)
    business_hybrid = HybridRetriever(business_vector, business_bm25)

    reranker = ReRanker(
        model_type=settings.RERANKER_TYPE,
        cross_encoder_model=settings.CROSS_ENCODER_MODEL,
    )

    retrieval_pipeline = RetrievalPipeline(
        sql_retriever=sql_hybrid,
        business_retriever=business_hybrid,
        reranker=reranker,
        query_understanding=QueryUnderstanding(),
        retrieval_top_k=settings.RETRIEVAL_TOP_K,
        rerank_top_k=settings.RERANK_TOP_K,
    )

    budgets = ContextBudgets(
        schema_chars=settings.SCHEMA_CONTEXT_CHAR_CAP,
        business_chars=settings.BUSINESS_CONTEXT_CHAR_CAP,
        sql_example_chars=settings.SQL_EXAMPLES_CHAR_CAP,
        global_chars=settings.GLOBAL_CONTEXT_CHAR_CAP,
    )

    generator = SQLGenerator(
        llm=LangChainLLM(),
        validator=SQLValidator(settings.DUCKDB_PATH),
    )

    return RAGSQLEngine(
        retrieval_pipeline=retrieval_pipeline,
        context_builder=ContextBuilder(),
        sql_generator=generator,
        budgets=budgets,
    )


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="RAG SQL Engine CLI")
    parser.add_argument("question", nargs="?", help="Natural language analytics question")
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    question = args.question or input("Question> ").strip()

    if not question:
        print("Error: question is required")
        return 1

    engine = build_engine()
    result = engine.answer(question)

    if result.is_valid and result.sql:
        print(result.sql)
        return 0

    print("SQL generation failed validation")
    if result.sql:
        print(f"Candidate SQL: {result.sql}")
    if result.validation_error:
        print(f"Validation error: {result.validation_error}")
    return 2


if __name__ == "__main__":
    raise SystemExit(main())

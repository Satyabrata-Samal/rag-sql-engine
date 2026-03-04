from __future__ import annotations

from pathlib import Path

from src.ingestion.bm25_builder import BM25Builder
from src.ingestion.markdown_processor import MarkdownProcessor
from src.ingestion.sql_processor import SQLProcessor
from src.ingestion.vectorstore_builder import VectorStoreBuilder
from src.utils.chunk_writer import save_chunks


def run_ingestion_pipeline() -> None:
    docs_path = Path("docs")
    raw_md_path = docs_path / "doc_files"

    chunk_path = Path("data/chunks")
    vector_path = Path("data/vectorstores")
    bm25_path = Path("data/bm25")

    markdown_processor = MarkdownProcessor()
    sql_processor = SQLProcessor()
    vector_builder = VectorStoreBuilder()
    bm25_builder = BM25Builder()

    all_md_chunks: list[dict] = []
    for md_file in raw_md_path.rglob("*.md"):
        chunks = markdown_processor.process_file(md_file)
        all_md_chunks.extend(chunks)

    save_chunks(all_md_chunks, chunk_path / "business_chunks.json")

    sql_chunks = sql_processor.process_file(docs_path / "metadata" / "validated_queries.json")
    save_chunks(sql_chunks, chunk_path / "sql_chunks.json")

    vector_builder.build(all_md_chunks, vector_path / "business_index")
    vector_builder.build(sql_chunks, vector_path / "sql_index")

    bm25_builder.build(all_md_chunks, bm25_path / "business_bm25.pkl")
    bm25_builder.build(sql_chunks, bm25_path / "sql_bm25.pkl")


if __name__ == "__main__":
    run_ingestion_pipeline()

from __future__ import annotations

import logging

from src.rag.sql_generator import SQLGenerator
from src.rag.types import ContextBudgets, SQLGenerationResult
from src.retrieval.context_builder import ContextBuilder
from src.retrieval.retrieval_pipeline import RetrievalPipeline


class RAGSQLEngine:
    """Service orchestration layer for production usage and CLI wrappers."""

    def __init__(
        self,
        retrieval_pipeline: RetrievalPipeline,
        context_builder: ContextBuilder,
        sql_generator: SQLGenerator,
        budgets: ContextBudgets,
    ):
        self.retrieval_pipeline = retrieval_pipeline
        self.context_builder = context_builder
        self.sql_generator = sql_generator
        self.budgets = budgets
        self.logger = logging.getLogger(__name__)

    def answer(self, question: str) -> SQLGenerationResult:
        if not question.strip():
            raise ValueError("question cannot be empty")

        self.logger.info("engine_answer_start")
        retrieval = self.retrieval_pipeline.retrieve(question)
        context = self.context_builder.build(
            sql_docs=retrieval.sql_context,
            business_docs=retrieval.business_context,
            budgets=self.budgets,
        )

        result = self.sql_generator.generate(question=question, context=context)
        result.metadata.update(
            {
                "query_type": retrieval.query_type,
                "sql_docs": len(retrieval.sql_context),
                "business_docs": len(retrieval.business_context),
            }
        )
        self.logger.info("engine_answer_complete valid=%s", result.is_valid)
        return result

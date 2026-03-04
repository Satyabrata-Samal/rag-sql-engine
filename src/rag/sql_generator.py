from __future__ import annotations

import logging
import re

from src.llm.base import BaseLLM
from src.rag.types import SQLGenerationResult, StructuredContext
from src.rag.sql_validator import SQLValidator


class SQLGenerator:
    """Generates SQL from structured RAG context and validates execution."""

    def __init__(self, llm: BaseLLM, validator: SQLValidator):
        self.llm = llm
        self.validator = validator
        self.logger = logging.getLogger(__name__)

    def generate(self, question: str, context: StructuredContext) -> SQLGenerationResult:
        messages = [
            {
                "role": "system",
                "content": (
                    "You are an expert SQL assistant. Return only a single SQL query. "
                    "Do not include markdown, explanations, or comments."
                ),
            },
            {
                "role": "user",
                "content": (
                    f"Question:\n{question}\n\n"
                    f"Context:\n{context.final_prompt_context}\n\n"
                    "Return one executable SQL query only."
                ),
            },
        ]

        raw_output = self.llm.generate(messages)
        sql = self._extract_sql(raw_output)
        if not sql:
            self.logger.error("sql_generation_failed reason=empty_sql")
            return SQLGenerationResult(
                sql=None,
                is_valid=False,
                validation_error="Model did not return SQL text",
                llm_raw_output=raw_output,
                metadata={"reason": "empty_sql"},
            )

        is_valid, error = self.validator.validate(sql)
        self.logger.info("sql_validation valid=%s", is_valid)
        return SQLGenerationResult(
            sql=sql,
            is_valid=is_valid,
            validation_error=error,
            llm_raw_output=raw_output,
            metadata={"token_estimate": context.token_estimate},
        )

    def _extract_sql(self, raw_output: str) -> str | None:
        text = raw_output.strip()
        if not text:
            return None

        fenced = re.search(r"```(?:sql)?\s*(.*?)```", text, flags=re.IGNORECASE | re.DOTALL)
        if fenced:
            text = fenced.group(1).strip()

        text = text.strip().rstrip(";")
        if not text:
            return None
        return f"{text};"

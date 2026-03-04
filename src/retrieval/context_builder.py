from __future__ import annotations

from src.rag.types import ContextBudgets, StructuredContext
from src.retrieval.types import RetrievedDocument


class ContextBuilder:
    """Builds structured prompt context with deterministic section budgets."""

    def build(
        self,
        sql_docs: list[RetrievedDocument],
        business_docs: list[RetrievedDocument],
        budgets: ContextBudgets,
    ) -> StructuredContext:
        schema_docs = [d for d in business_docs if d.metadata.get("doc_type") == "schema"]
        business_only_docs = [d for d in business_docs if d.metadata.get("doc_type") != "schema"]

        schema_text, schema_trunc = self._join_with_cap(schema_docs, budgets.schema_chars)
        business_text, business_trunc = self._join_with_cap(
            business_only_docs,
            budgets.business_chars,
        )
        sql_text, sql_trunc = self._join_with_cap(sql_docs, budgets.sql_example_chars)

        rendered = self._render(schema_text, business_text, sql_text)
        global_truncated = False
        if len(rendered) > budgets.global_chars:
            rendered = rendered[: budgets.global_chars].rstrip()
            global_truncated = True

        token_estimate = max(1, len(rendered) // 4)
        metadata = {
            "schema_docs": len(schema_docs),
            "business_docs": len(business_only_docs),
            "sql_docs": len(sql_docs),
            "schema_truncated": schema_trunc,
            "business_truncated": business_trunc,
            "sql_truncated": sql_trunc,
            "global_truncated": global_truncated,
            "char_count": len(rendered),
        }

        return StructuredContext(
            schema_context=schema_text,
            business_rules=business_text,
            similar_sql_examples=sql_text,
            final_prompt_context=rendered,
            token_estimate=token_estimate,
            metadata=metadata,
        )

    def _join_with_cap(
        self,
        docs: list[RetrievedDocument],
        char_cap: int,
    ) -> tuple[str, bool]:
        if char_cap <= 0:
            return "None", bool(docs)

        blocks: list[str] = []
        used = 0
        truncated = False
        separator = "\n\n---\n\n"

        for doc in docs:
            block = doc.content.strip()
            candidate_len = len(block) if not blocks else len(separator) + len(block)
            if used + candidate_len <= char_cap:
                blocks.append(block)
                used += candidate_len
                continue

            remaining = char_cap - used
            if remaining > 0:
                if blocks:
                    if remaining > len(separator):
                        blocks.append(block[: remaining - len(separator)].rstrip())
                else:
                    blocks.append(block[:remaining].rstrip())
            truncated = True
            break

        if not blocks:
            return "None", truncated

        return separator.join(blocks), truncated

    def _render(self, schema_context: str, business_rules: str, sql_examples: str) -> str:
        return (
            "[SCHEMA CONTEXT]\n"
            f"{schema_context}\n\n"
            "[BUSINESS RULES]\n"
            f"{business_rules}\n\n"
            "[SIMILAR SQL EXAMPLES]\n"
            f"{sql_examples}"
        )

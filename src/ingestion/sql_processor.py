from __future__ import annotations

import re
from pathlib import Path

from config import settings
from src.utils.loaders import load_json_file


class SQLProcessor:
    """Processes validated SQL examples into retrieval-ready chunks."""

    def __init__(self):
        self.base_path = Path(settings.DOCS_PATH)

    def process_file(self, filename: str | Path) -> list[dict]:
        input_path = Path(filename)
        if input_path.is_absolute() or len(input_path.parts) > 1:
            file_path = input_path
        else:
            file_path = self.base_path / input_path

        data = load_json_file(file_path)
        if not isinstance(data, list):
            raise ValueError("SQL JSON must be a list of examples")

        return self._format_chunks(data, str(file_path))

    def _extract_tables(self, sql: str) -> list[str]:
        tables = re.findall(
            r"(?:from|join)\s+([a-zA-Z_][a-zA-Z0-9_]*)",
            sql,
            re.IGNORECASE,
        )
        return sorted(set(tables))

    def _format_chunks(self, data: list[dict], source_file: str) -> list[dict]:
        formatted_chunks: list[dict] = []

        for i, item in enumerate(data):
            sql = str(item.get("sql", ""))
            sql_id = str(item.get("id", f"unknown_{i}"))
            query_type = str(item.get("type", "unknown"))
            tables = self._extract_tables(sql)

            search_text = (
                f"SQL Example ID: {sql_id}\n"
                f"Query Type: {query_type}\n"
                f"Tables Used: {', '.join(tables)}\n"
                "SQL Query:\n"
                f"{sql}"
            )

            formatted_chunks.append(
                {
                    "chunk_id": sql_id,
                    "content": search_text,
                    "metadata": {
                        "doc_type": "sql_example",
                        "query_type": query_type,
                        "tables": tables,
                        "source_file": source_file,
                    },
                }
            )

        return formatted_chunks

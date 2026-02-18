from pathlib import Path
from typing import List, Dict
import re

from src.utils.loaders import load_json_file
from config import settings


class SQLProcessor:
    """
    Processes raw SQL example JSON into RAG-ready chunks.
    """

    def __init__(self, metadata_folder: str = "metadata"):
        self.base_path = Path(settings.DOCS_PATH) 
    def process_file(self, filename: str) -> List[Dict]:
        input_path = Path(filename)

        # If caller passed a path that already includes directories (or an absolute path),
        # use it as-is. Otherwise, resolve relative to DOCS_PATH.
        if input_path.is_absolute() or len(input_path.parts) > 1:
            file_path = input_path
        else:
            file_path = self.base_path / input_path

        data = load_json_file(file_path)

        if not isinstance(data, list):
            raise ValueError("SQL JSON must be a list of examples.")

        return self._format_chunks(data, str(file_path))

    def _extract_tables(self, sql: str) -> List[str]:
        """
        Very basic table extraction from FROM and JOIN.
        """
        tables = re.findall(r"(?:from|join)\s+([a-zA-Z_][a-zA-Z0-9_]*)", sql, re.IGNORECASE)
        return list(set(tables))

    def _format_chunks(self, data: List[Dict], source_file: str) -> List[Dict]:
        formatted_chunks = []

        for i, item in enumerate(data):

            sql = item.get("sql", "")
            sql_id = item.get("id", f"unknown_{i}")
            query_type = item.get("type", "unknown")

            tables = self._extract_tables(sql)

            # Create better embedding text
            search_text = f"""
            SQL Example ID: {sql_id}
            Query Type: {query_type}
            Tables Used: {', '.join(tables)}
            SQL Query:
            {sql}
            """

            formatted_chunks.append(
                {
                    "chunk_id": f"{sql_id}",
                    "content": search_text.strip(),
                    "metadata": {
                        "doc_type": "sql_example",
                        "query_type": query_type,
                        "tables": tables,
                        "source_file": source_file,
                    },
                }
            )

        return formatted_chunks

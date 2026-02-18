from pathlib import Path
from typing import List, Dict, Tuple
from langchain_text_splitters import MarkdownHeaderTextSplitter

from src.utils.loaders import load_markdown_file
from config import settings


DEFAULT_HEADERS = [
    ("#", "Header 1"),
    ("##", "Header 2"),
    ("###", "Header 3"),
]


class MarkdownProcessor:
    """
    Handles structured markdown splitting for RAG ingestion.
    """

    def __init__(
        self,
        headers_to_split_on: List[Tuple[str, str]] = DEFAULT_HEADERS,
        return_each_line: bool = False,
    ):
        self.headers_to_split_on = headers_to_split_on
        self.return_each_line = return_each_line

        self.splitter = MarkdownHeaderTextSplitter(
            headers_to_split_on=self.headers_to_split_on,
            return_each_line=self.return_each_line,
        )

    def process_file(self, file_path: Path) -> List[Dict]:
        """
        Load and split a markdown file.

        - If `file_path` is already a path (absolute or includes directories), use it as-is.
        - If it's a bare filename, resolve it relative to settings.DOCS_PATH.
        """
        input_path = Path(file_path)

        if input_path.is_absolute() or len(input_path.parts) > 1:
            resolved_path = input_path
        else:
            resolved_path = Path(settings.DOCS_PATH) / input_path

        markdown_text = load_markdown_file(resolved_path)

        splits = self.splitter.split_text(markdown_text)

        return self._format_splits(splits, str(resolved_path))

    def _format_splits(self, splits, source_file: str) -> List[Dict]:
        """
        Convert LangChain Document objects into structured dict format.
        """
        formatted_chunks = []

        for i, doc in enumerate(splits):
            formatted_chunks.append(
                {
                    "chunk_id": f"{source_file}_chunk_{i}",
                    "content": doc.page_content,
                    "metadata": {
                        **doc.metadata,
                        "source_file": source_file,
                    },
                }
            )

        return formatted_chunks

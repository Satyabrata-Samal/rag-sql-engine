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

    def process_file(self, file_path: Path)-> List[Dict]:
        """
        Load and split markdown file from docs directory.
        """
        file_path = Path(settings.MD_PATH) / filename
        markdown_text = load_markdown_file(file_path)

        splits = self.splitter.split_text(markdown_text)

        return self._format_splits(splits, filename)

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

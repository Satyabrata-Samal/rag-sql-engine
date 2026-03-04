from __future__ import annotations

from pathlib import Path

from langchain_community.vectorstores import FAISS
from langchain_core.documents import Document
from langchain_openai import OpenAIEmbeddings

from config import settings


class VectorStoreBuilder:
    """Builds and persists FAISS indexes from chunk payloads."""

    def __init__(self):
        self.embeddings = OpenAIEmbeddings(
            model=settings.EMBEDDING_MODEL,
            openai_api_key=settings.OPENAI_API_KEY,
        )

    def build(self, chunks: list[dict], save_path: Path) -> None:
        documents = [
            Document(
                page_content=chunk["content"],
                metadata={**chunk.get("metadata", {}), "chunk_id": chunk.get("chunk_id")},
            )
            for chunk in chunks
        ]

        vectorstore = FAISS.from_documents(documents, self.embeddings)
        save_path.mkdir(parents=True, exist_ok=True)
        vectorstore.save_local(str(save_path))

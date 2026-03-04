from __future__ import annotations

from pathlib import Path

from langchain_community.vectorstores import FAISS
from langchain_openai import OpenAIEmbeddings

from config import settings
from src.retrieval.types import RetrievedDocument, StoreType


class VectorRetriever:
    """FAISS-backed retriever with normalized retrieval output contract."""

    def __init__(self, index_path: Path, source_store: StoreType):
        self.index_path = index_path
        self.source_store = source_store
        if not self.index_path.exists():
            raise FileNotFoundError(f"Vector index not found: {self.index_path}")

        embeddings = OpenAIEmbeddings(
            model=settings.EMBEDDING_MODEL,
            openai_api_key=settings.OPENAI_API_KEY,
        )
        self.store = FAISS.load_local(
            str(self.index_path),
            embeddings,
            allow_dangerous_deserialization=True,
        )

    def search(self, query: str, top_k: int) -> list[RetrievedDocument]:
        if top_k <= 0:
            return []

        results = self.store.similarity_search_with_score(query, k=top_k)
        docs: list[RetrievedDocument] = []
        for i, (doc, distance) in enumerate(results):
            # FAISS returns distance where smaller is better. We negate for higher-is-better fusion.
            vector_score = -float(distance)
            doc_id = str(doc.metadata.get("chunk_id", f"{self.source_store}_{i}"))
            docs.append(
                RetrievedDocument(
                    doc_id=doc_id,
                    content=doc.page_content,
                    metadata=dict(doc.metadata),
                    source_store=self.source_store,
                    vector_score=vector_score,
                )
            )
        return docs

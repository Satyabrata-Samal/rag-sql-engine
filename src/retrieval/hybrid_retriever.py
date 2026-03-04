from __future__ import annotations

from collections.abc import Iterable

from src.retrieval.types import RetrievedDocument


class HybridRetriever:
    """Hybrid vector + BM25 retriever with min-max fusion."""

    def __init__(self, vector_retriever, bm25_retriever):
        self.vector_retriever = vector_retriever
        self.bm25_retriever = bm25_retriever
        self.semantic_weight = 0.5
        self.lexical_weight = 0.5

    def set_weights(self, semantic_weight: float, lexical_weight: float) -> None:
        if semantic_weight < 0 or lexical_weight < 0:
            raise ValueError("weights must be non-negative")
        total = semantic_weight + lexical_weight
        if total == 0:
            raise ValueError("at least one retrieval weight must be > 0")
        self.semantic_weight = semantic_weight / total
        self.lexical_weight = lexical_weight / total

    def search(self, query: str, top_k: int) -> list[RetrievedDocument]:
        if top_k <= 0:
            return []

        vector_docs = self.vector_retriever.search(query, top_k)
        bm25_docs = self.bm25_retriever.search(query, top_k)

        merged = self._merge(vector_docs, bm25_docs)
        self._normalize(merged, "vector_score")
        self._normalize(merged, "bm25_score")

        for doc in merged:
            doc.fusion_score = (
                self.semantic_weight * doc.vector_score
                + self.lexical_weight * doc.bm25_score
            )

        merged.sort(
            key=lambda d: (
                d.fusion_score,
                d.vector_score,
                d.bm25_score,
                d.doc_id,
            ),
            reverse=True,
        )
        return merged[:top_k]

    def _merge(
        self,
        vector_docs: Iterable[RetrievedDocument],
        bm25_docs: Iterable[RetrievedDocument],
    ) -> list[RetrievedDocument]:
        docs: dict[str, RetrievedDocument] = {}

        for doc in vector_docs:
            docs[doc.doc_id] = RetrievedDocument(
                doc_id=doc.doc_id,
                content=doc.content,
                metadata=doc.metadata,
                source_store=doc.source_store,
                vector_score=doc.vector_score,
            )

        for doc in bm25_docs:
            if doc.doc_id in docs:
                docs[doc.doc_id].bm25_score = doc.bm25_score
            else:
                docs[doc.doc_id] = RetrievedDocument(
                    doc_id=doc.doc_id,
                    content=doc.content,
                    metadata=doc.metadata,
                    source_store=doc.source_store,
                    bm25_score=doc.bm25_score,
                )

        return list(docs.values())

    def _normalize(self, docs: list[RetrievedDocument], field: str) -> None:
        if not docs:
            return
        values = [float(getattr(doc, field)) for doc in docs]
        min_v = min(values)
        max_v = max(values)

        if min_v == max_v:
            for doc in docs:
                setattr(doc, field, 1.0)
            return

        span = max_v - min_v
        for doc in docs:
            normalized = (float(getattr(doc, field)) - min_v) / span
            setattr(doc, field, normalized)

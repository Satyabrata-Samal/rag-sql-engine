from __future__ import annotations

from src.retrieval.types import RetrievedDocument, StoreType


class BM25Retriever:
    """BM25 retriever that follows the `.search(query, top_k)` contract."""

    def __init__(self, documents: list[dict], source_store: StoreType):
        if not documents:
            raise ValueError("BM25Retriever requires at least one document")
        self.documents = documents
        self.source_store = source_store
        self._tokenized_corpus = [doc["content"].split() for doc in documents]
        try:
            from rank_bm25 import BM25Okapi  # type: ignore
        except ImportError:
            BM25Okapi = None
        self._bm25 = BM25Okapi(self._tokenized_corpus) if BM25Okapi else None

    def search(self, query: str, top_k: int) -> list[RetrievedDocument]:
        if top_k <= 0:
            return []

        scores = self._scores(query)
        ranked_indices = sorted(
            range(len(scores)),
            key=lambda i: float(scores[i]),
            reverse=True,
        )[:top_k]

        results: list[RetrievedDocument] = []
        for idx in ranked_indices:
            doc = self.documents[idx]
            results.append(
                RetrievedDocument(
                    doc_id=str(doc.get("chunk_id", idx)),
                    content=doc["content"],
                    metadata=doc.get("metadata", {}),
                    source_store=self.source_store,
                    bm25_score=float(scores[idx]),
                )
            )
        return results

    def _scores(self, query: str) -> list[float]:
        tokenized_query = query.split()
        if self._bm25 is not None:
            return [float(x) for x in self._bm25.get_scores(tokenized_query)]

        # Fallback lexical scorer when rank_bm25 is unavailable.
        query_terms = set(tokenized_query)
        scores: list[float] = []
        for tokens in self._tokenized_corpus:
            overlap = len(query_terms.intersection(tokens))
            scores.append(float(overlap))
        return scores

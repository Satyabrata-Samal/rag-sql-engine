from __future__ import annotations

from typing import Protocol

from src.retrieval.types import RetrievedDocument


class CrossEncoderLike(Protocol):
    def predict(self, pairs: list[tuple[str, str]]) -> list[float]:
        ...


class ReRanker:
    """Re-ranks documents using cross-encoder or optional LLM scoring."""

    def __init__(
        self,
        model_type: str = "cross_encoder",
        cross_encoder_model: str = "cross-encoder/ms-marco-MiniLM-L-6-v2",
        llm=None,
        cross_encoder: CrossEncoderLike | None = None,
    ):
        self.model_type = model_type
        self.cross_encoder_model_name = cross_encoder_model
        self.llm = llm
        self.cross_encoder = cross_encoder

        if model_type not in {"cross_encoder", "llm"}:
            raise ValueError("model_type must be 'cross_encoder' or 'llm'")

    def rerank(
        self,
        query: str,
        docs: list[RetrievedDocument],
        top_k: int = 5,
    ) -> list[RetrievedDocument]:
        if top_k <= 0:
            raise ValueError("top_k must be > 0")
        if not docs:
            return []

        if self.model_type == "cross_encoder":
            scored = self._score_with_cross_encoder(query, docs)
        else:
            scored = self._score_with_llm(query, docs)

        scored.sort(
            key=lambda d: (
                d.rerank_score if d.rerank_score is not None else float("-inf"),
                d.fusion_score,
                d.doc_id,
            ),
            reverse=True,
        )
        return scored[:top_k]

    def _score_with_cross_encoder(
        self,
        query: str,
        docs: list[RetrievedDocument],
    ) -> list[RetrievedDocument]:
        if self.cross_encoder is None:
            try:
                from sentence_transformers import CrossEncoder
            except ImportError as exc:
                raise ImportError(
                    "sentence-transformers is required for cross_encoder reranking"
                ) from exc
            self.cross_encoder = CrossEncoder(self.cross_encoder_model_name)

        pairs = [(query, doc.content) for doc in docs]
        scores = self.cross_encoder.predict(pairs)

        scored: list[RetrievedDocument] = []
        for doc, score in zip(docs, scores):
            doc.rerank_score = float(score)
            scored.append(doc)
        return scored

    def _score_with_llm(
        self,
        query: str,
        docs: list[RetrievedDocument],
    ) -> list[RetrievedDocument]:
        if self.llm is None:
            from src.llm.langchain_client import LangChainLLM

            self.llm = LangChainLLM()

        scored: list[RetrievedDocument] = []
        for doc in docs:
            messages = [
                {
                    "role": "system",
                    "content": "You score relevance from 0 to 10. Respond with a number only.",
                },
                {
                    "role": "user",
                    "content": (
                        f"Query:\n{query}\n\nDocument:\n{doc.content}\n\n"
                        "Return only a numeric relevance score from 0 to 10."
                    ),
                },
            ]
            response = self.llm.generate(messages)
            try:
                doc.rerank_score = float(response.strip())
            except ValueError:
                doc.rerank_score = 0.0
            scored.append(doc)

        return scored

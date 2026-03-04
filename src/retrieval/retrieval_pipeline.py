from __future__ import annotations

import logging

from src.retrieval.query_context import QueryUnderstanding
from src.retrieval.reranker import ReRanker
from src.retrieval.types import RetrievalBundle


class RetrievalPipeline:
    """Orchestrates query understanding, hybrid retrieval, and reranking."""

    def __init__(
        self,
        sql_retriever,
        business_retriever,
        reranker: ReRanker,
        query_understanding: QueryUnderstanding | None = None,
        retrieval_top_k: int = 12,
        rerank_top_k: int = 5,
    ):
        self.query_understanding = query_understanding or QueryUnderstanding()
        self.sql_retriever = sql_retriever
        self.business_retriever = business_retriever
        self.reranker = reranker
        self.retrieval_top_k = retrieval_top_k
        self.rerank_top_k = rerank_top_k
        self.logger = logging.getLogger(__name__)

    def retrieve(self, query: str) -> RetrievalBundle:
        profile = self.query_understanding.analyze(query)
        self.logger.info(
            "query_intent intent=%s semantic_weight=%.2f lexical_weight=%.2f targets=%s",
            profile.intent_type,
            profile.semantic_weight,
            profile.lexical_weight,
            ",".join(profile.target_stores),
        )

        sql_docs = []
        business_docs = []

        if "sql" in profile.target_stores:
            self.sql_retriever.set_weights(
                semantic_weight=profile.semantic_weight,
                lexical_weight=profile.lexical_weight,
            )
            sql_docs = self.sql_retriever.search(query, self.retrieval_top_k)

        if "business" in profile.target_stores:
            self.business_retriever.set_weights(
                semantic_weight=profile.semantic_weight,
                lexical_weight=profile.lexical_weight,
            )
            business_docs = self.business_retriever.search(query, self.retrieval_top_k)

        sql_docs = self.reranker.rerank(query, sql_docs, top_k=self.rerank_top_k)
        business_docs = self.reranker.rerank(
            query,
            business_docs,
            top_k=self.rerank_top_k,
        )
        self.logger.info(
            "retrieval_complete sql_docs=%d business_docs=%d",
            len(sql_docs),
            len(business_docs),
        )

        return RetrievalBundle(
            query_type=profile.intent_type,
            sql_context=sql_docs,
            business_context=business_docs,
        )

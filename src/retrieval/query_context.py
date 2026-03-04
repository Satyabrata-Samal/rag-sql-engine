from __future__ import annotations

import re
from dataclasses import dataclass
from enum import Enum
from typing import Literal

from src.retrieval.types import StoreType


class QueryIntent(str, Enum):
    SQL_GENERATION = "sql_generation"
    BUSINESS = "business"
    MIXED = "mixed"


@dataclass(slots=True)
class QueryProfile:
    """Result of deterministic query analysis used for dynamic retrieval."""

    intent_type: Literal["sql_generation", "business", "mixed"]
    semantic_weight: float
    lexical_weight: float
    target_stores: list[StoreType]
    confidence: float


class QueryUnderstanding:
    """Rule-based query classifier with deterministic weight selection."""

    SQL_KEYWORDS = {
        "select",
        "count",
        "sum",
        "avg",
        "join",
        "group by",
        "order by",
        "where",
        "having",
        "limit",
        "sql",
        "query",
        "table",
        "column",
    }

    BUSINESS_KEYWORDS = {
        "revenue",
        "growth",
        "trend",
        "business",
        "insight",
        "analysis",
        "why",
        "explain",
        "definition",
        "metric",
        "kpi",
    }

    def analyze(self, query: str) -> QueryProfile:
        query_lower = query.lower().strip()
        sql_score = self._keyword_score(query_lower, self.SQL_KEYWORDS)
        business_score = self._keyword_score(query_lower, self.BUSINESS_KEYWORDS)

        if sql_score > 0 and business_score == 0:
            return QueryProfile(
                intent_type=QueryIntent.SQL_GENERATION.value,
                semantic_weight=0.6,
                lexical_weight=0.4,
                target_stores=["sql", "business"],
                confidence=1.0,
            )

        if business_score > 0 and sql_score == 0:
            return QueryProfile(
                intent_type=QueryIntent.BUSINESS.value,
                semantic_weight=0.75,
                lexical_weight=0.25,
                target_stores=["business"],
                confidence=1.0,
            )

        # Mixed or low-confidence class falls back to both stores.
        confidence = 0.5 if sql_score == 0 and business_score == 0 else 0.75
        return QueryProfile(
            intent_type=QueryIntent.MIXED.value,
            semantic_weight=0.5,
            lexical_weight=0.5,
            target_stores=["sql", "business"],
            confidence=confidence,
        )

    def _keyword_score(self, query: str, keywords: set[str]) -> int:
        score = 0
        for keyword in keywords:
            if re.search(rf"\b{re.escape(keyword)}\b", query):
                score += 1
        return score

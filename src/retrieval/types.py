from __future__ import annotations

from dataclasses import dataclass, field
from typing import Any, Literal


StoreType = Literal["sql", "business"]


@dataclass(slots=True)
class RetrievedDocument:
    """Canonical retrieval document shape shared across retrieval stages."""

    doc_id: str
    content: str
    metadata: dict[str, Any]
    source_store: StoreType
    vector_score: float = 0.0
    bm25_score: float = 0.0
    fusion_score: float = 0.0
    rerank_score: float | None = None


@dataclass(slots=True)
class RetrievalBundle:
    """Typed retrieval output consumed by context builder and generation."""

    query_type: str
    sql_context: list[RetrievedDocument] = field(default_factory=list)
    business_context: list[RetrievedDocument] = field(default_factory=list)

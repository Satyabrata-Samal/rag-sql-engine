from __future__ import annotations

import pickle
from pathlib import Path

from src.ingestion.bm25_index import BM25Retriever
from src.retrieval.types import StoreType


def load_bm25_retriever(path: Path, source_store: StoreType) -> BM25Retriever:
    """Load persisted BM25 payload and create a retriever."""
    if not path.exists():
        raise FileNotFoundError(f"BM25 payload not found: {path}")

    with path.open("rb") as f:
        payload = pickle.load(f)

    if not isinstance(payload, dict) or "documents" not in payload:
        raise ValueError(f"Invalid BM25 payload at {path}")

    documents = payload["documents"]
    return BM25Retriever(documents=documents, source_store=source_store)

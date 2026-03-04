"""Backward-compatible module exposing retrieval pipeline and retrievers."""

from src.retrieval.hybrid_retriever import HybridRetriever
from src.retrieval.retrieval_pipeline import RetrievalPipeline

__all__ = ["HybridRetriever", "RetrievalPipeline"]

from __future__ import annotations

from abc import ABC, abstractmethod


class BaseLLM(ABC):
    @abstractmethod
    def generate(self, messages: list[dict[str, str]]) -> str:
        """Generate a text response from structured chat messages."""

    @abstractmethod
    def embed(self, text: str) -> list[float]:
        """Generate an embedding vector for retrieval."""

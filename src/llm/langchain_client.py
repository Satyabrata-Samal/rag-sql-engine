from __future__ import annotations

from typing import Any

from langchain_openai import ChatOpenAI, OpenAIEmbeddings

from config import settings
from src.llm.base import BaseLLM


class LangChainLLM(BaseLLM):
    """LangChain wrapper around OpenAI chat and embedding models."""

    def __init__(self):
        self.chat_model = ChatOpenAI(
            model=settings.CHAT_MODEL,
            temperature=settings.TEMPERATURE,
            api_key=settings.OPENAI_API_KEY,
            timeout=settings.TIMEOUT,
        )

        self.embedding_model = OpenAIEmbeddings(
            model=settings.EMBEDDING_MODEL,
            api_key=settings.OPENAI_API_KEY,
        )

    def generate(self, messages: list[dict[str, str]]) -> str:
        if not isinstance(messages, list):
            raise TypeError("messages must be a list of role/content dictionaries")
        response = self.chat_model.invoke(messages)
        content: Any = getattr(response, "content", "")
        return str(content)

    def embed(self, text: str) -> list[float]:
        return self.embedding_model.embed_query(text)

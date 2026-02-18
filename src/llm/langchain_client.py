from typing import List, Dict
from langchain_openai import ChatOpenAI, OpenAIEmbeddings
from src.llm.base import BaseLLM
from src.core.config import settings


class LangChainLLM(BaseLLM):

    def __init__(self):
        self.chat_model = ChatOpenAI(
            model=settings.CHAT_MODEL,
            temperature=settings.TEMPERATURE,
            api_key=settings.OPENAI_API_KEY,
        )

        self.embedding_model = OpenAIEmbeddings(
            model=settings.EMBEDDING_MODEL,
            api_key=settings.OPENAI_API_KEY,
        )

    # -----------------------
    # Chat generation
    # -----------------------
    def generate(self, messages: List[Dict[str, str]]) -> str:
        response = self.chat_model.invoke(messages)
        return response.content

    # -----------------------
    # Embeddings
    # -----------------------
    def embed(self, text: str) -> List[float]:
        return self.embedding_model.embed_query(text)


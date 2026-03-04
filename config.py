from __future__ import annotations

from pathlib import Path

from pydantic_settings import BaseSettings


class Settings(BaseSettings):
    OPENAI_API_KEY: str
    CHAT_MODEL: str = "gpt-4o-mini"
    EMBEDDING_MODEL: str = "text-embedding-3-small"
    TEMPERATURE: float = 0.1
    TIMEOUT: int = 30

    DUCKDB_PATH: str = "sql_db/chinook.duckdb"
    DOCS_PATH: str = "docs"

    SQL_VECTOR_INDEX_PATH: str = "data/vectorstores/sql_index"
    BUSINESS_VECTOR_INDEX_PATH: str = "data/vectorstores/business_index"
    SQL_BM25_PATH: str = "data/bm25/sql_bm25.pkl"
    BUSINESS_BM25_PATH: str = "data/bm25/business_bm25.pkl"

    RETRIEVAL_TOP_K: int = 12
    RERANK_TOP_K: int = 5
    RERANKER_TYPE: str = "cross_encoder"
    CROSS_ENCODER_MODEL: str = "cross-encoder/ms-marco-MiniLM-L-6-v2"

    SCHEMA_CONTEXT_CHAR_CAP: int = 2500
    BUSINESS_CONTEXT_CHAR_CAP: int = 2500
    SQL_EXAMPLES_CHAR_CAP: int = 3000
    GLOBAL_CONTEXT_CHAR_CAP: int = 7000

    LOG_LEVEL: str = "INFO"

    class Config:
        env_file = ".env" if Path(".env").exists() else None
        env_file_encoding = "utf-8"


settings = Settings()

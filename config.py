from pydantic_settings import BaseSettings
from pathlib import Path
# from dotenv import 

class Settings(BaseSettings):
    OPENAI_API_KEY: str  
    CHAT_MODEL: str = "gpt-4o-mini"
    EMBEDDING_MODEL: str = "text-embedding-3-small"
    TEMPERATURE: float = 0.2
    TIMEOUT: int = 30
    DUCKDB_PATH: str = "sql_db/chinook.duckdb"
    VECTOR_STORE_PATH: str = "vectorstore/vector_store.db"
    MD_PATH: str = "docs/doc_files"
    JSON_PATH: str = "docs/metadata"

    class Config:
        env_file = ".env" if Path(".env").exists() else None
        env_file_encoding = "utf-8"

settings = Settings()

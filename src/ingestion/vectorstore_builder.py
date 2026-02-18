from pathlib import Path
from typing import List, Dict

from langchain_openai import OpenAIEmbeddings
from langchain_community.vectorstores import FAISS
from langchain_core.documents import Document

from config import settings


class VectorStoreBuilder:
    def __init__(self):
        self.embeddings = OpenAIEmbeddings(
            model=settings.EMBEDDING_MODEL,
            openai_api_key=settings.OPENAI_API_KEY,
        )

    def build(self, chunks: List[Dict], save_path: Path):
        documents = [
            Document(
                page_content=chunk["content"],
                metadata=chunk["metadata"]
            )
            for chunk in chunks
        ]

        vectorstore = FAISS.from_documents(documents, self.embeddings)

        save_path.mkdir(parents=True, exist_ok=True)
        vectorstore.save_local(str(save_path))

        print(f"Saved vectorstore → {save_path}")

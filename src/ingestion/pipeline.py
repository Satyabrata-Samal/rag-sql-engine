from pathlib import Path

from src.ingestion.markdown_processor import MarkdownProcessor
from src.ingestion.sql_processor import SQLProcessor
from src.ingestion.vectorstore_builder import VectorStoreBuilder
from src.utils.chunk_writer import save_chunks


def run_ingestion_pipeline():
    docs_path = Path("docs")
    raw_md_path = docs_path / "doc_files"
    chunk_path = Path("data/chunks")
    vector_path = Path("data/vectorstores")

    markdown_processor = MarkdownProcessor()
    sql_processor = SQLProcessor()
    vector_builder = VectorStoreBuilder()

    # -------------------------
    # 1 Process Markdown
    # -------------------------
    all_md_chunks = []

    for md_file in raw_md_path.rglob("*.md"):
        chunks = markdown_processor.process_file(md_file)
        all_md_chunks.extend(chunks)

    save_chunks(all_md_chunks, chunk_path / "business_chunks.json")

    # -------------------------
    # 2️ Process SQL
    # -------------------------
    sql_chunks = sql_processor.process_file(
        docs_path / "metadata" / "validated_queries.json"
    )

    save_chunks(sql_chunks, chunk_path / "sql_chunks.json")

    # -------------------------
    # 3️ Build Vectorstores
    # -------------------------
    vector_builder.build(
        all_md_chunks,
        vector_path / "business_index",
    )

    vector_builder.build(
        sql_chunks,
        vector_path / "sql_index",
    )


if __name__ == "__main__":
    run_ingestion_pipeline()
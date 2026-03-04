# RAG SQL Engine

Production-oriented RAG-based SQL generation engine.

The system takes a natural language analytics question and returns SQL grounded in:
- schema/business context
- validated SQL examples
- hybrid retrieval (Vector + BM25)

## Architecture

Pipeline:
1. Query understanding (rule-based intent + dynamic retrieval weights)
2. Hybrid retrieval per store (vector + BM25 + fusion)
3. Reranking (cross-encoder by default; LLM optional)
4. Structured context builder (section caps + global cap)
5. SQL generation
6. SQL validation against DuckDB

Primary service API:
- `RAGSQLEngine.answer(question: str) -> SQLGenerationResult`

CLI entrypoint:
- `main.py`

## Requirements

- Python 3.10+
- OpenAI API key
- Prebuilt artifacts in `data/`:
  - `data/vectorstores/sql_index`
  - `data/vectorstores/business_index`
  - `data/bm25/sql_bm25.pkl`
  - `data/bm25/business_bm25.pkl`

## Setup

```bash
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

Create `.env`:

```bash
OPENAI_API_KEY=your_key_here
```

Optional settings are in `config.py` (retrieval sizes, caps, paths, reranker model).

## Build Artifacts (Ingestion)

```bash
python -m src.ingestion.pipeline
```

This generates/updates:
- `data/chunks/*.json`
- `data/vectorstores/*`
- `data/bm25/*.pkl`

## Run CLI

```bash
python main.py "Show total invoice revenue by country"
```

Expected behavior:
- prints SQL on success
- prints validation failure details on invalid SQL

## Simple Web UI

Run a minimal local UI to test questions quickly:

```bash
python ui.py --host 127.0.0.1 --port 8080
```

Open:
- `http://127.0.0.1:8080`

The page lets you submit a question and see:
- generated SQL (if valid)
- candidate SQL + validation error (if invalid)

## Tests

Standard focused run:

```bash
python -m pytest -q -p no:debugging \
  tests/test_query_understanding.py \
  tests/test_hybrid_retriever.py \
  tests/test_context_builder.py \
  tests/test_retriever_contracts.py \
  tests/test_engine_integration.py \
  tests/test_sql_text_splitter.py \
  tests/test_llm_manual.py
```

Quick smoke command:

```bash
./scripts/smoke_test.sh
```

## Troubleshooting

- If `pytest` crashes at startup in your local environment, keep `-p no:debugging`.
- If runtime fails with missing artifact errors, run ingestion first.
- If DuckDB validation fails to initialize, confirm `duckdb` is installed and `DUCKDB_PATH` is correct.

## Repo Notes

- Detailed implementation context: `CONTEXT.md`
- Runtime config: `config.py`
- Engine orchestrator: `src/rag/engine.py`

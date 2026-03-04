# RAG SQL Engine

Production-oriented RAG-based SQL generation engine.

This project takes a natural language analytics question and returns SQL grounded in:
- business/schema context
- validated SQL examples
- hybrid retrieval (Vector + BM25)

## End-to-End Flow

1. Query understanding (rule-based intent + dynamic weights)
2. Hybrid retrieval per store (vector + BM25 + fusion)
3. Reranking (cross-encoder default, LLM optional)
4. Structured context assembly (section caps + global cap)
5. SQL generation (LLM)
6. SQL validation (DuckDB)

Primary API:
- `RAGSQLEngine.answer(question: str) -> SQLGenerationResult`

Entrypoints:
- CLI: `main.py`
- Web UI: `ui.py`

## Project Layout

- `src/rag/` - engine orchestration, SQL generation, SQL validation, output types
- `src/retrieval/` - query understanding, vector/BM25 hybrid retrieval, reranking, context builder
- `src/ingestion/` - markdown/sql chunking, FAISS build, BM25 artifact build/load
- `src/llm/` - LLM and embedding client abstraction
- `src/utils/` - loaders, logging, helpers
- `tests/` - focused unit/integration tests
- `data/` - chunks, vector indexes, DuckDB files, BM25 payloads
- `diagram.md` - mermaid machine diagram for flow

## Requirements

- Python 3.10+
- OpenAI API key
- Dependencies from `requirements.txt`

Optional but recommended artifacts in `data/`:
- `data/vectorstores/sql_index`
- `data/vectorstores/business_index`
- `data/bm25/sql_bm25.pkl`
- `data/bm25/business_bm25.pkl`

Note:
- If BM25 `.pkl` files are missing, runtime falls back to `data/chunks/*.json` and builds BM25 in-memory.

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

Tune runtime in `config.py`:
- retrieval top-k / rerank top-k
- context caps
- artifact paths
- reranker mode/model

## Build Artifacts (Ingestion)

```bash
python -m src.ingestion.pipeline
```

Generates/updates:
- `data/chunks/*.json`
- `data/vectorstores/*`
- `data/bm25/*.pkl`

## Run

### CLI

```bash
python main.py "Show total invoice revenue by country"
```

Behavior:
- prints SQL on success
- prints candidate SQL + validation error on failure

### Simple Web UI

```bash
python ui.py --host 127.0.0.1 --port 8080
```

Open:
- `http://127.0.0.1:8080`

## Test

Focused suite:

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

One-command smoke run:

```bash
./scripts/smoke_test.sh
```

## Troubleshooting

- If `pytest` crashes at startup, keep `-p no:debugging`.
- If vector indexes are missing, run ingestion first.
- If DuckDB validation fails, verify `duckdb` installation and `DUCKDB_PATH` in `config.py`.
- If Mermaid preview shows plain text, see **Diagram Preview** below.

## Diagram Preview (Mermaid)

Files:
- `diagram.md` (preview/render)
- `diagram.txt` (plain text)

In VS Code:
1. Open `diagram.md`
2. Press `Shift + Command + V`
3. Or side-by-side: `Command + K`, then `V`

If Mermaid renders as text:
1. Confirm fence is ` ```mermaid ... ``` `
2. Enable setting: `Markdown > Preview: Mermaid`
3. Install `Markdown Preview Mermaid Support` (`bierner.markdown-mermaid`)
4. Reload window (`Developer: Reload Window`)

## Related Docs

- `CONTEXT.md` - full implementation context and decisions
- `config.py` - runtime settings
- `src/rag/engine.py` - service orchestrator

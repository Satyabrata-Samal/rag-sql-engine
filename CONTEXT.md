# Project Context - RAG SQL Engine (Production Refactor Baseline)

## 1) Goal
Build a production-grade RAG SQL engine where a user asks a natural-language analytics question and the system returns executable SQL grounded in:
- schema/business knowledge
- validated SQL examples
- hybrid retrieval (vector + BM25)

This repo now has deterministic query understanding, typed retrieval contracts, dynamic fusion, reranking, structured context construction, SQL generation, and SQL validation.

## 2) Current Scope
Primary implementation lives in:
- `/Volumes/SBS1/hello_world/projects/rag_sql/src`
- `/Volumes/SBS1/hello_world/projects/rag_sql/main.py`
- `/Volumes/SBS1/hello_world/projects/rag_sql/config.py`
- `/Volumes/SBS1/hello_world/projects/rag_sql/tests`

`docs/` remains source corpus for ingestion jobs, but runtime architecture is centered on generated artifacts in `data/`.

## 3) Core Contracts (Authoritative)

### Retrieval document contract
`RetrievedDocument` (`/Volumes/SBS1/hello_world/projects/rag_sql/src/retrieval/types.py`):
- `doc_id: str`
- `content: str`
- `metadata: dict[str, Any]`
- `source_store: Literal["sql", "business"]`
- `vector_score: float`
- `bm25_score: float`
- `fusion_score: float`
- `rerank_score: float | None`

### Retriever contract
Every retriever exposes:
- `.search(query: str, top_k: int) -> list[RetrievedDocument]`

Implemented in:
- `/Volumes/SBS1/hello_world/projects/rag_sql/src/retrieval/vector_retriever.py`
- `/Volumes/SBS1/hello_world/projects/rag_sql/src/ingestion/bm25_index.py` (`BM25Retriever`)
- `/Volumes/SBS1/hello_world/projects/rag_sql/src/retrieval/hybrid_retriever.py`

### Query understanding contract
`QueryUnderstanding.analyze(query)` returns `QueryProfile` (`/Volumes/SBS1/hello_world/projects/rag_sql/src/retrieval/query_context.py`):
- `intent_type: Literal["sql_generation", "business", "mixed"]`
- `semantic_weight: float`
- `lexical_weight: float`
- `target_stores: list["sql" | "business"]`
- `confidence: float`

### Context contract
`ContextBuilder.build(sql_docs, business_docs, budgets)` returns `StructuredContext`:
- `schema_context`
- `business_rules`
- `similar_sql_examples`
- `final_prompt_context`
- `token_estimate`

Files:
- `/Volumes/SBS1/hello_world/projects/rag_sql/src/retrieval/context_builder.py`
- `/Volumes/SBS1/hello_world/projects/rag_sql/src/rag/types.py`

### SQL generation contract
`SQLGenerator.generate(question, context)` returns `SQLGenerationResult`:
- `sql: str | None`
- `is_valid: bool`
- `validation_error: str | None`
- `llm_raw_output: str`
- `metadata: dict[str, Any]`

Files:
- `/Volumes/SBS1/hello_world/projects/rag_sql/src/rag/sql_generator.py`
- `/Volumes/SBS1/hello_world/projects/rag_sql/src/rag/sql_validator.py`

## 4) Runtime Architecture (Implemented)

1. Query understanding
- Rule-based intent classification + dynamic retrieval weights.
- File: `/Volumes/SBS1/hello_world/projects/rag_sql/src/retrieval/query_context.py`

2. Hybrid retrieval per store
- Vector search + BM25 search -> merge -> min-max normalize -> weighted fusion.
- File: `/Volumes/SBS1/hello_world/projects/rag_sql/src/retrieval/hybrid_retriever.py`

3. Reranking
- Default: cross-encoder.
- Optional: LLM rerank.
- File: `/Volumes/SBS1/hello_world/projects/rag_sql/src/retrieval/reranker.py`

4. Structured context
- Sectioned output:
  - `[SCHEMA CONTEXT]`
  - `[BUSINESS RULES]`
  - `[SIMILAR SQL EXAMPLES]`
- Section caps + global cap are enforced deterministically.
- File: `/Volumes/SBS1/hello_world/projects/rag_sql/src/retrieval/context_builder.py`

5. SQL generation + validation
- SQL-only prompt contract.
- Output is validated against DuckDB.
- No auto-retry.
- Files:
  - `/Volumes/SBS1/hello_world/projects/rag_sql/src/rag/sql_generator.py`
  - `/Volumes/SBS1/hello_world/projects/rag_sql/src/rag/sql_validator.py`

6. Orchestration service + CLI
- Service API: `RAGSQLEngine.answer(question)`
- CLI wrapper: `/Volumes/SBS1/hello_world/projects/rag_sql/main.py`
- Simple local UI: `/Volumes/SBS1/hello_world/projects/rag_sql/ui.py` (HTTP form-based test harness)

## 5) Ingestion and Artifact Build Path

Ingestion pipeline:
- `/Volumes/SBS1/hello_world/projects/rag_sql/src/ingestion/pipeline.py`

Builds:
- chunks JSON (business/sql)
- FAISS indexes (business/sql)
- BM25 payload files (business/sql)

BM25 persistence/load:
- Builder: `/Volumes/SBS1/hello_world/projects/rag_sql/src/ingestion/bm25_builder.py`
- Loader: `/Volumes/SBS1/hello_world/projects/rag_sql/src/ingestion/bm25_loader.py`

## 6) Config and Environment

Main settings are in `/Volumes/SBS1/hello_world/projects/rag_sql/config.py`:
- model config (`CHAT_MODEL`, `EMBEDDING_MODEL`, `TEMPERATURE`)
- artifact paths (`SQL_VECTOR_INDEX_PATH`, `BUSINESS_VECTOR_INDEX_PATH`, `SQL_BM25_PATH`, `BUSINESS_BM25_PATH`)
- retrieval/rerank (`RETRIEVAL_TOP_K`, `RERANK_TOP_K`, `RERANKER_TYPE`)
- context budgets (`SCHEMA_CONTEXT_CHAR_CAP`, `BUSINESS_CONTEXT_CHAR_CAP`, `SQL_EXAMPLES_CHAR_CAP`, `GLOBAL_CONTEXT_CHAR_CAP`)

## 7) Known Risks / Residual Gaps

1. Runtime dependency/environment risk
- Local `pytest` crashes at startup in this machine's Python 3.13 environment (segfault in pytest debug stack).
- Code compiles (`python -m compileall`) but full test execution is blocked by environment.

2. Artifact availability risk
- Runtime requires prebuilt vector and BM25 files at configured paths.
- Missing artifact files will fail fast with explicit errors.

3. Cross-encoder dependency risk
- Default reranker requires `sentence_transformers` model availability.

## 8) Tests Added/Updated

Updated tests:
- `/Volumes/SBS1/hello_world/projects/rag_sql/tests/test_sql_text_splitter.py`
- `/Volumes/SBS1/hello_world/projects/rag_sql/tests/test_llm_manual.py`

New tests:
- `/Volumes/SBS1/hello_world/projects/rag_sql/tests/test_query_understanding.py`
- `/Volumes/SBS1/hello_world/projects/rag_sql/tests/test_hybrid_retriever.py`
- `/Volumes/SBS1/hello_world/projects/rag_sql/tests/test_context_builder.py`
- `/Volumes/SBS1/hello_world/projects/rag_sql/tests/test_retriever_contracts.py`
- `/Volumes/SBS1/hello_world/projects/rag_sql/tests/test_engine_integration.py`

Additional test coverage:
- `/Volumes/SBS1/hello_world/projects/rag_sql/tests/test_llm_manual.py` now includes empty-model-output handling.
- `/Volumes/SBS1/hello_world/projects/rag_sql/tests/test_query_understanding.py` now includes low-signal confidence behavior.

## 9) Run Commands

Ingestion build:
```bash
python -m src.ingestion.pipeline
```

CLI usage:
```bash
python main.py "Show total invoice revenue by country"
```

Simple UI:
```bash
python ui.py --host 127.0.0.1 --port 8080
```

Compile-only validation:
```bash
python -m compileall -q src tests main.py
```

Stable pytest run command in this environment:
```bash
python -m pytest -q -p no:debugging tests/test_query_understanding.py tests/test_hybrid_retriever.py tests/test_context_builder.py tests/test_retriever_contracts.py tests/test_engine_integration.py tests/test_sql_text_splitter.py tests/test_llm_manual.py
```

Latest result:
- `13 passed` (with one Pydantic deprecation warning from external dependency internals).

Release hygiene additions:
- `/Volumes/SBS1/hello_world/projects/rag_sql/README.md` now includes setup, ingestion, run, test, troubleshooting.
- `/Volumes/SBS1/hello_world/projects/rag_sql/scripts/smoke_test.sh` runs compile + focused test suite in one command.
- `/Volumes/SBS1/hello_world/projects/rag_sql/ui.py` provides a minimal browser UI for manual SQL generation testing.

## 10) High-Signal File Map

- `/Volumes/SBS1/hello_world/projects/rag_sql/main.py` - thin CLI and dependency composition.
- `/Volumes/SBS1/hello_world/projects/rag_sql/ui.py` - simple browser UI for manual test flow.
- `/Volumes/SBS1/hello_world/projects/rag_sql/src/rag/engine.py` - orchestrator service (`RAGSQLEngine`).
- `/Volumes/SBS1/hello_world/projects/rag_sql/src/retrieval/retrieval_pipeline.py` - query understanding + retrieve + rerank.
- `/Volumes/SBS1/hello_world/projects/rag_sql/src/retrieval/hybrid_retriever.py` - fusion engine.
- `/Volumes/SBS1/hello_world/projects/rag_sql/src/retrieval/vector_retriever.py` - FAISS adapter.
- `/Volumes/SBS1/hello_world/projects/rag_sql/src/ingestion/bm25_index.py` - BM25 retriever.
- `/Volumes/SBS1/hello_world/projects/rag_sql/src/retrieval/context_builder.py` - sectioned, capped context.
- `/Volumes/SBS1/hello_world/projects/rag_sql/src/rag/sql_generator.py` - SQL generation + extraction.
- `/Volumes/SBS1/hello_world/projects/rag_sql/src/rag/sql_validator.py` - DuckDB validation.
- `/Volumes/SBS1/hello_world/projects/rag_sql/config.py` - runtime settings.

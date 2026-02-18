# Project Descriptor (.d) — rag-sql-engine

## 1) What this repo is
An MVP **RAG + SQL** engine that:
- **Ingests** reference documents (business rules, DB schema, validated SQL/metadata)
- Builds **chunks** and **vector indexes** (FAISS) per knowledge domain
- Uses **retrieval + routing** to select the right knowledge sources
- Uses an **LLM (OpenAI via LangChain)** to generate SQL and/or analysis grounded in retrieved context
- Optionally uses **DuckDB** for query execution / analytical workflows

This repo is structured for a “docs → processed artifacts → retrieval → prompting → generation” loop.

---

## 2) Tech stack (from requirements)
- **duckdb**: embedded analytics DB (note: appears duplicated in `requirements.txt`)
- **pandas / numpy**: data handling
- **faiss-cpu**: vector search / ANN index
- **rank-bm25**: lexical retrieval (hybrid retrieval likely)
- **openai**: embeddings + chat/completions
- **langchain**: orchestration + LLM wrapper client
- **python-dotenv**: environment-based configuration (`.env`)
- **tqdm**: progress bars

---

## 3) Key folders & artifacts
### 3.1 Raw inputs (authoritative sources)
- `docs/`
  - Business rules / schema / metrics markdowns (planned inputs; matches README intent)
  - `docs/metadata/` (validated SQL json corpus is also present here in the repo)
- `data/raw/` (current ingestion code reads from here)
  - Markdown inputs: `data/raw/**/*.md`
  - SQL metadata input: `data/raw/sql/validated_queries.json`

### 3.2 Processed outputs (generated)
- `data/chunks/`
  - `business_chunks.json` (generated)
  - `sql_chunks.json` (generated)
  - `schema_chunks.json` (planned; not currently produced by `src/ingestion/pipeline.py`)
- `data/vectorstores/`
  - `business_index/` (generated)
  - `sql_index/` (generated)
  - `schema_index/` (planned; not currently built by `src/ingestion/pipeline.py`)

### 3.3 Application code
- `src/`
  - `src/ingestion/pipeline.py` (current ingestion entry)
  - `src/ingestion/vectorstore_builder.py` (FAISS index builder)
  - `src/utils/chunk_writer.py` (writes chunk JSON)
  - `src/llm/langchain_client.py` (LangChain-based LLM client)

### 3.4 Entrypoints & config
- `main.py` (present but currently empty; intended as runtime entrypoint)
- `config.py` (present)
- `.env` (implied via `python-dotenv`)
---

## 4) System architecture (as intended)
### 4.1 Ingestion pipeline
Goal: transform raw markdown/sql/metadata into searchable knowledge.
Likely steps:
1. Load raw documents from `docs/` and/or `docs/raw/...`
2. Normalize/clean text (strip SQL headers, remove irrelevant lines, preserve code blocks)
3. Split into chunks (size tuned for embedding + retrieval)
4. Embed chunks (OpenAI embeddings)
5. Build vectorstores (FAISS) per domain
6. Persist artifacts to `data/chunks/` and `data/vectorstores/`

### 4.2 Retrieval and routing
- Separate retrievers for:
  - Business rules
  - DB schema
  - SQL examples/validated SQL metadata
- A “hybrid router” is implied (README): routes queries to the most relevant retriever(s), possibly mixing BM25 + vectors.

### 4.3 Generation (RAG)
- Prompts combine:
  - User question
  - Retrieved context snippets
  - Formatting instructions (SQL-only vs explanation)
- LLM interaction is via `src/llm/langchain_client.py`.

### 4.4 Optional execution/validation
- DuckDB can be used to:
  - Execute generated SQL (if data is present/loaded)
  - Validate query shape / syntax
  - Produce result previews for analysis answers

---

## 5) Current repo status (based on available evidence)
### Implemented / present
- Dependency set for RAG + SQL
- Document corpus structure under `docs/` including many `.sql` examples
- README-described pipeline components exist (at least by file names):
  - `src/ingestion/pipeline.py`
  - `src/llm/langchain_client.py`
  - `main.py`, `config.py`
- A working convention for generated outputs under `data/`

### Likely WIP / areas to confirm by code inspection
- Exact chunking strategy and metadata schema for chunks
- Whether retrieval is pure-vector, pure-BM25, or hybrid
- Query routing logic: heuristics vs learned classifier
- SQL execution harness: how DuckDB is loaded with data and how results are surfaced
- Prompt templates: where stored and how selected (SQL generation vs analysis)

---

## 6) How to run (expected workflow)
1. Create `.env` with keys (at minimum):
   - `OPENAI_API_KEY=...`
2. Put/update source docs in `docs/`
3. Run ingestion (via `main.py` or ingestion pipeline module) to generate:
   - `data/chunks/*`
   - `data/vectorstores/*`
4. Ask questions / generate SQL (via `main.py` interactive or a function call)

---

## 7) Conventions & assumptions
- Domain separation is central: **business**, **schema**, **sql/metadata** are indexed separately.
- Source `.sql` files may contain noise (download links, narrative text); ingestion should treat them as semi-structured documents.
- Artifacts are checked/used locally (FAISS indexes stored on disk, not a hosted vector DB).

---

## 8) Suggested “next documentation upgrades”
(For future updates to this `.d` file)
- Add exact command(s) used to run ingestion and query mode
- Document chunk JSON schema (fields: `id`, `source`, `domain`, `text`, `embedding_model`, etc.)
- Document vectorstore on-disk layout (index file names, metadata store)
- Document prompt templates and guardrails for SQL correctness
- Add examples:
  - “Generate SQL for …”
  - “Explain metric definition …”
  - “Validate this SQL against schema …”

---

## 9) File index (high-signal)
- `requirements.txt`
- `config.py`
- `main.py` (currently empty)
- `src/ingestion/pipeline.py`
- `src/ingestion/vectorstore_builder.py`
- `src/utils/chunk_writer.py`
- `src/llm/langchain_client.py`
- `scripts/` (utilities, e.g., validation helpers)
- `docs/` (reference documents + SQL metadata corpus)
- `data/` (generated chunks + vectorstores)
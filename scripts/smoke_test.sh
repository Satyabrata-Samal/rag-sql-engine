#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

echo "[1/3] Compile check"
python -m compileall -q src tests main.py

echo "[2/3] Focused test suite"
python -m pytest -q -p no:debugging \
  tests/test_query_understanding.py \
  tests/test_hybrid_retriever.py \
  tests/test_context_builder.py \
  tests/test_retriever_contracts.py \
  tests/test_engine_integration.py \
  tests/test_sql_text_splitter.py \
  tests/test_llm_manual.py

echo "[3/3] Smoke checks passed"

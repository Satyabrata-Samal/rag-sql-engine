from __future__ import annotations

from pathlib import Path


class SQLValidator:
    """Executes SQL in DuckDB to verify syntax and executable shape."""

    def __init__(self, db_path: str):
        try:
            import duckdb as _duckdb
        except ImportError as exc:
            raise ImportError(
                "duckdb is required for SQL validation. Install dependencies first."
            ) from exc

        self._duckdb = _duckdb
        db_candidate = Path(db_path)
        if not db_candidate.exists():
            fallback = Path("data") / db_candidate
            if fallback.exists():
                db_candidate = fallback
        if not db_candidate.exists():
            raise FileNotFoundError(f"DuckDB file not found: {db_path}")

        self.db_path = db_candidate

    def validate(self, sql: str) -> tuple[bool, str | None]:
        try:
            con = self._duckdb.connect(str(self.db_path), read_only=True)
            try:
                con.execute(sql).fetchmany(1)
            finally:
                con.close()
            return True, None
        except Exception as exc:
            return False, str(exc)

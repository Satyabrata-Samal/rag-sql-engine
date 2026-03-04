from __future__ import annotations

import pickle
from pathlib import Path


class BM25Builder:
    """Persists BM25 corpus payload for deterministic runtime loading."""

    def build(self, chunks: list[dict], save_path: Path) -> None:
        if not isinstance(chunks, list):
            raise ValueError("chunks must be a list")
        save_path.parent.mkdir(parents=True, exist_ok=True)
        payload = {
            "documents": chunks,
            "version": 1,
        }
        with save_path.open("wb") as f:
            pickle.dump(payload, f)

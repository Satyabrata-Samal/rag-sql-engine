from __future__ import annotations

import json
from pathlib import Path
from typing import Any


def load_markdown_file(file_path: Path) -> str:
    """Load markdown file content safely."""
    if not file_path.exists():
        raise FileNotFoundError(f"File not found: {file_path}")

    with file_path.open("r", encoding="utf-8") as f:
        return f.read()


def load_json_file(file_path: Path) -> Any:
    """Load JSON file content safely."""
    if not file_path.exists():
        raise FileNotFoundError(f"File not found: {file_path}")

    with file_path.open("r", encoding="utf-8") as f:
        return json.load(f)

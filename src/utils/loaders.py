from pathlib import Path
from typing import Optional
import json


def load_markdown_file(file_path: Path) -> str:
    """
    Load markdown file content safely.
    """
    if not file_path.exists():
        raise FileNotFoundError(f"File not found: {file_path}")

    with open(file_path, "r", encoding="utf-8") as f:
        return f.read()

def load_json_file(file_path: Path) -> str:
    """
    Load markdown file content safely.
    """
    if not file_path.exists():
        raise FileNotFoundError(f"File not found: {file_path}")
    
    with open(file_path, "r", encoding="utf-8") as f:
        return json.load(f)  
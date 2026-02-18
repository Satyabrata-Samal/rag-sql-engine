from pathlib import Path
from typing import List, Dict, Any
import json


def save_chunks(chunks: List[Dict[str, Any]], output_path: Path) -> None:
    """
    Save processed chunks to a JSON file.

    Args:
        chunks: List of chunk dictionaries
        output_path: Destination JSON file path
    """
    if not isinstance(chunks, list):
        raise ValueError("Chunks must be a list.")

    output_path.parent.mkdir(parents=True, exist_ok=True)

    with open(output_path, "w", encoding="utf-8") as f:
        json.dump(chunks, f, indent=2)

    print(f"Saved {len(chunks)} chunks → {output_path}")

from __future__ import annotations

from dataclasses import dataclass, field
from typing import Any


@dataclass(slots=True)
class ContextBudgets:
    """Character budgets for deterministic context construction."""

    schema_chars: int = 2500
    business_chars: int = 2500
    sql_example_chars: int = 3000
    global_chars: int = 7000


@dataclass(slots=True)
class StructuredContext:
    """Structured context passed to SQL generator."""

    schema_context: str
    business_rules: str
    similar_sql_examples: str
    final_prompt_context: str
    token_estimate: int
    metadata: dict[str, Any] = field(default_factory=dict)


@dataclass(slots=True)
class SQLGenerationResult:
    """Final generation payload returned to callers and CLI."""

    sql: str | None
    is_valid: bool
    validation_error: str | None
    llm_raw_output: str
    metadata: dict[str, Any] = field(default_factory=dict)

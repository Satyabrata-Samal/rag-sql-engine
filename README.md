MVP for a RAG-SQL Application

## Dir Structure
rag_sql/
│
├── docs/                      # Raw source documents (input)
│   ├── business_rules.md
│   ├── database_schema.md
│   ├── metrics_definations.md
│   └── metadata/              # validated SQL json
│
├── data/                      # Processed artifacts (generated)
│   ├── chunks/
│   │   ├── business_chunks.json
│   │   ├── schema_chunks.json
│   │   └── sql_chunks.json
│   │
│   └── vectorstores/
│       ├── business_index/
│       ├── schema_index/
│       └── sql_index/
│
├── src/
│   ├── llm/
│   │   └── langchain_client.py
│   │
│   ├── ingestion/             # Loading + processing
│   │   ├── loaders.py
│   │   ├── markdown_processor.py
│   │   ├── sql_processor.py
│   │   ├── schema_processor.py
│   │   └── pipeline.py
│   │
│   ├── retrieval/
│   │   ├── business_retriever.py
│   │   ├── sql_retriever.py
│   │   ├── schema_retriever.py
│   │   └── hybrid_router.py
│   │
│   ├── prompts/
│   │   ├── sql_generation_prompt.py
│   │   └── analysis_prompt.py
│   │
│   └── rag/
│       ├── sql_rag_pipeline.py
│       └── analysis_rag_pipeline.py
│
├── tests/
│
├── .env
├── config.py
└── main.py

import os
import re
import json
from pathlib import Path

class SQLQueryExtractor:
    def __init__(self, sql_directory):
        self.sql_directory = sql_directory
        self.queries = []
        self.query_id = 0
    
    def extract_queries_from_file(self, filepath, filename):
        queries = []
        try:
            with open(filepath, 'r', encoding='utf-8', errors='ignore') as f:
                content = f.read()
        except Exception as e:
            print(f"  ⚠️  Error reading {filename}: {e}")
            return queries
        
        # Remove comments
        content = re.sub(r'--.*?$', '', content, flags=re.MULTILINE)
        content = re.sub(r'/\*.*?\*/', '', content, flags=re.DOTALL)
        
        # Split by semicolon
        statements = content.split(';')
        
        for statement in statements:
            statement = statement.strip()
            
            # Filter: SELECT queries only, minimum 50 chars
            if 'SELECT' in statement.upper() and len(statement) > 50:
                self.query_id += 1
                
                queries.append({
                    'id': f"query_{self.query_id:04d}",
                    'sql': statement,
                    'source_file': filename,
                    'type': self._classify_query(statement),
                    'file_type': 'sql'
                })
        
        return queries
    
    def _classify_query(self, sql):
        sql_upper = sql.upper()
        if 'GROUP BY' in sql_upper:
            return 'select_aggregate'
        elif 'JOIN' in sql_upper:
            return 'select_join'
        elif 'UNION' in sql_upper:
            return 'select_union'
        else:
            return 'select_basic'
    
    def extract_all_from_directory(self):
        print(f"\n{'='*60}")
        print("EXTRACTING QUERIES FROM SQL FILES")
        print(f"{'='*60}\n")
        
        sql_files = sorted(Path(self.sql_directory).glob('**/*.sql'))
        
        if not sql_files:
            print(f"❌ No .sql files found in {self.sql_directory}")
            return []
        
        print(f"✅ Found {len(sql_files)} .sql files\n")
        
        for filepath in sql_files:
            filename = filepath.name
            print(f"📄 {filename}")
            
            queries = self.extract_queries_from_file(str(filepath), filename)
            self.queries.extend(queries)
            
            print(f"   → Extracted {len(queries)} queries")
        
        return self.queries
    
    def save_to_json(self, output_file):
        os.makedirs(os.path.dirname(output_file), exist_ok=True)
        
        with open(output_file, 'w') as f:
            json.dump(self.queries, f, indent=2)
        
        print(f"\n✅ Saved {len(self.queries)} queries to: {output_file}\n")

# Run it
if __name__ == "__main__":
    extractor = SQLQueryExtractor("data/raw/sql_queries")
    queries = extractor.extract_all_from_directory()
    
    if queries:
        extractor.save_to_json("data/metadata/scraped_queries.json")
        print(f"✅ Success! Total: {len(queries)} queries")
    else:
        print("❌ No queries extracted")
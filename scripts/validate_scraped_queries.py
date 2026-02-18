import duckdb
import json
import os

class QueryValidator:
    def __init__(self, db_path):
        self.con = duckdb.connect(db_path)
        self.valid = []
        self.invalid = []
    
    def validate_query(self, query):
        try:
            self.con.execute(query['sql']).fetchall()
            return True
        except Exception as e:
            query['error'] = str(e)
            return False
    
    def validate_all(self, queries):
        print(f"Validating {len(queries)} queries...\n")
        
        for i, query in enumerate(queries, 1):
            if i % 50 == 0:
                pct = 100 * i // len(queries)
                print(f"Progress: {i}/{len(queries)} ({pct}%)")
            
            if self.validate_query(query):
                self.valid.append(query)
            else:
                self.invalid.append(query)
    
    def save_results(self, valid_file, invalid_file):
        os.makedirs(os.path.dirname(valid_file), exist_ok=True)
        
        with open(valid_file, 'w') as f:
            json.dump(self.valid, f, indent=2)
        with open(invalid_file, 'w') as f:
            json.dump(self.invalid, f, indent=2)
        
        total = len(self.valid) + len(self.invalid)
        success_rate = 100 * len(self.valid) // total if total > 0 else 0
        
        print(f"\n{'='*60}")
        print("VALIDATION SUMMARY")
        print(f"{'='*60}")
        print(f"Total validated:     {total}")
        print(f"✅ Valid:            {len(self.valid)}")
        print(f"❌ Invalid:          {len(self.invalid)}")
        print(f"Success rate:        {success_rate}%")
        print(f"{'='*60}\n")
        
        print(f"✅ Saved: {valid_file}")
        print(f"❌ Saved: {invalid_file}")

# Main
if __name__ == "__main__":
    validator = QueryValidator('data/processed/chinook.duckdb')
    
    with open('data/metadata/scraped_queries.json') as f:
        all_queries = json.load(f)
    
    print(f"Total queries available: {len(all_queries)}")
    
    # ✅ VALIDATE ONLY FIRST 300
    queries = all_queries[300:]
    print(f"Validating sample: {len(queries)}\n")
    
    validator.validate_all(queries)
    validator.save_results(
        'data/metadata/validated_queries.json',
        'data/metadata/invalid_queries.json'
    )
    
    validator.con.close()
import 

class HybridRetriever:
    def __init__(self, business_index_path, sql_index_path):
        self.business_store = self._load_index(business_index_path)
        self.sql_store = self._load_index(sql_index_path)

    def retrieve(self, query: str, top_k: int = 5):
        # 1. embed query
        # 2. search both indexes
        # 3. merge results
        # 4. return structured docs
        return results

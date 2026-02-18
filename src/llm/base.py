from abc import ABC, abstractmethod
from typing import List, Dict


class BaseLLM(ABC):

    @abstractmethod
    def generate(self, messages: List[Dict[str, str]]) -> str:
        pass

    @abstractmethod
    def embed(self, text: str) -> List[float]:
        pass

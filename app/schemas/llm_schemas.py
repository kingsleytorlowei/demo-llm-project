from pydantic import BaseModel, Field, validator
import re

class InputData(BaseModel):
    prompt: str = Field(min_length=1, max_length=1000,examples=["Tell me a joke about programming"])
    @validator('prompt')
    def sanitize_prompt(cls, v):
        # Remove any HTML tags
        v = re.sub('<[^<]+?>', '', v)
        # Escape special characters
        v = v.replace("'", "''").replace('"', '""')
        return v

class OutputData(BaseModel):
    prompt: str = Field(examples=["Why do programmers prefer dark mode? Because light attracts bugs!"])
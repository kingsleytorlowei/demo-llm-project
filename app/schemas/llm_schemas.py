from pydantic import BaseModel, Field

class InputData(BaseModel):
    prompt: str = Field(examples=["Tell me a joke about programming"])

class OutputData(BaseModel):
    prompt: str = Field(examples=["Why do programmers prefer dark mode? Because light attracts bugs!"])
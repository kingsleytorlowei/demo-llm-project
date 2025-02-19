from langchain.llms import OpenAI
from fastapi import HTTPException

async def generate_text(prompt: str, max_tokens: int = 50):
    try:
        llm = OpenAI(api_key="your_openai_api_key")
        response = await llm.agenerate([prompt], max_tokens=max_tokens)
        return response.generations[0][0].text
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

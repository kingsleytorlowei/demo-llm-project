from fastapi import APIRouter, HTTPException
from app.core.llm_handler import generate_text
from app.schemas.llm_schemas import InputData, OutputData

router = APIRouter()

@router.post("/generate", response_model=OutputData)
async def generate(input_data: InputData):
    try:
        response = await generate_text(input_data.prompt)
        return OutputData(response=response)
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@router.get("/health")
async def health_check():
    return {"status": "healthy"}
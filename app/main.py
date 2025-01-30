from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from app.api.routes import llm_routes
from app.core import config

app = FastAPI(
    title=config.PROJECT_NAME,
    version=config.PROJECT_VERSION,
    description=config.PROJECT_DESCRIPTION,
)

# Configure CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=config.ALLOWED_ORIGINS,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Include routers
app.include_router(llm_routes.router, prefix="/api/v1")

@app.get("/")
async def root():
    return {"message": "Welcome to the LLM-based API"}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)

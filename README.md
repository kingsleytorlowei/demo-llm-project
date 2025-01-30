# LLM-based API with Python

This project demonstrates how to build an API that leverages Large Language Models (LLMs) using Python. It combines the power of LLMs with FastAPI to create a scalable and efficient API for text generation.

## Prerequisites

- Python 3.8+
- pip (Python package manager)
- virtualenv (recommended for creating isolated Python environments)

## Setup

1. Clone the repository:
git clone https://github.com/kingsleytorlowei/demo-llm-project.git
cd demo-llm-project


1. Create and activate a virtual environment:
python -m venv .venv
source .venv/bin/activate # On Windows, use venv\Scripts\activate


1. Install the required packages:
pip install -r requirements.txt


1. Set up your OpenAI API key:
- Create a `.env` file in the project root
- Add your OpenAI API key: `OPENAI_API_KEY=your_api_key_here`

## Running the API

1. Start the FastAPI server:
uvicorn app.main:app --reload


1. The API will be available at `http://localhost:8000`

2. You can access the API documentation at `http://localhost:8000/docs`

## Project Structure

- `main.py`: The main FastAPI application
- `llm_handler.py`: Module for interacting with the LLM
- `requirements.txt`: List of Python dependencies
- `.env`: Environment variables (not tracked by git)

## Usage

Send a POST request to the `/generate` endpoint with a JSON payload containing the `prompt` field:

curl -X POST "http://localhost:8000/generate" -H "Content-Type: application/json" -d '{"prompt":"Tell me a joke about programming"}'


## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
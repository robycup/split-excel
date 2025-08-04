#!/bin/bash
# Script to run the Excel Splitter application using uv

# Install dependencies if needed
uv pip install -r requirements.txt

# Run the Flask application
uv run flask --app app.py run --host=0.0.0.0

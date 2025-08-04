FROM python:3.10-slim

WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Create directories
RUN mkdir -p templates uploads

# Expose port
EXPOSE 5000

# Run the application
CMD gunicorn --bind 0.0.0.0:${PORT:-5000} --workers=2 --threads=4 app:app

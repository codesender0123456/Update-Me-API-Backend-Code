FROM python:3.9-slim

WORKDIR /app

# Copy dependency definitions
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application files
COPY . .

# Expose the port Render expects
EXPOSE 10000

# The startup command is baked right into the Dockerfile
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "10000"]

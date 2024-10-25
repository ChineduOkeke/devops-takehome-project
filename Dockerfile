FROM python:3.11-slim

# Set work directory
WORKDIR /app

# Install dependencies
RUN pip install poetry

# Copy project files
COPY . /app

# Install Python dependencies via poetry
RUN poetry install


# Expose port
EXPOSE 8080

# Command to run the app
CMD ["poetry", "run", "python3", "weather_app/app.py"]


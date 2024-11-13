FROM python:3.9

WORKDIR /app/backend

# Copy and install dependencies
COPY requirements.txt /app/backend
RUN pip install -r requirements.txt

# Copy application code
COPY . /app/backend

# Expose the application port
EXPOSE 8000

# Run the Django server
CMD python /app/backend/manage.py runserver 0.0.0.0:8000

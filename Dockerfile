# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed dependencies specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Install additional Python packages
RUN pip install Django==4.2 django-jazzmin psycopg2-binary pillow social-auth-app-django djangorestframework chatterbot==1.0.4 django-import-export PyYaml django-cors-headers

# Database migrations
RUN python manage.py makemigrations
RUN python manage.py migrate

# Expose port 8000 to the outside world
EXPOSE 8000

# Define environment variable
ENV NAME World

# Run Django server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

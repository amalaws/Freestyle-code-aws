# Use an official Python image as the base
FROM python:3.9

# Set the working directory in the container
WORKDIR /app

# Install system dependencies
RUN apt-get update -y && apt-get install -y \
    mysql-client \
    && rm -rf /var/lib/apt/lists/*

# Copy application files into the container
COPY . .

# Install required Python packages
RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir \
       flask \
       pymysql \
       boto3 

# Expose the application port (Change if needed)
EXPOSE 5000

# Command to run the application
CMD ["python3", "EmpApp.py"]

# Use an official Python runtime as the base image
FROM python:3.9

# Set the working directory inside the container
WORKDIR /app

# Copy application files into the container
COPY . /app

# Update system packages (for both Amazon Linux and Ubuntu)
RUN apt-get update && \
    apt-get install -y mysql-client && \
    apt-get clean

# Install required Python libraries
RUN pip install --no-cache-dir PyMySQL boto3 flask

# Expose port 5000 for Flask app
EXPOSE 5000

# Run the application
CMD ["python3", "EmpApp.py"]

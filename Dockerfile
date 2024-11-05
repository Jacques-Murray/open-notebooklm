FROM python:3.12-slim

# Install git
RUN apt-get update && apt-get install -y git

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN python -m pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Make port 7860 available to the world outside this container
EXPOSE 7860

# Define environment variable
ENV FIREWORKS_API_KEY=""

# Run app.py when the container launches
CMD ["python", "app.py"]
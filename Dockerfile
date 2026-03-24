# Use an official, lightweight Python runtime
FROM python:3.10-slim

# Set the working directory inside the container to /app
WORKDIR /app

# Copy ONLY the requirements file first. 
# (This is a Docker best practice: it caches the installed libraries so you 
# don't have to reinstall them every time you change a line of Python code).
COPY requirements.txt .

# Install the dependencies from your requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your project files (including your Python scripts) into the container
COPY . .

# Keep the container alive in the background so you can run your scripts
CMD ["tail", "-f", "/dev/null"]
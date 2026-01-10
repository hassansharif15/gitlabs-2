Ì∞≥ Flask + MySQL with Docker (Multi-Stage Build)
Ì≥ò Overview

This project demonstrates how to containerize a Flask application that connects to a MySQL database, using Docker Compose and a multi-stage Dockerfile for optimized image size and performance.

The app runs a simple Flask API that connects to a MySQL database and displays the MySQL version.

hello_flask/
‚îÇ
‚îú‚îÄ‚îÄ app.py                # Flask app connecting to MySQL
‚îú‚îÄ‚îÄ Docker-compose.yml    # Defines Flask and MySQL containers
‚îú‚îÄ‚îÄ Dockerfile            # Multi-stage Docker build file
‚îî‚îÄ‚îÄ README.md             # This documentation

‚öôÔ∏è   Technologies Used

Ì∞ç Python 3.8 (Flask)

Ì∑ÑÔ∏è MySQL 5.7

Ì∞≥ Docker & Docker Compose

‚öôÔ∏è Multi-stage Docker Build

Flask application (app.py)

from flask import Flask
import MySQLdb

app = Flask(__name__)

@app.route('/')
def hello_world():
    # Connect to the MySQL database
    db = MySQLdb.connect(
        host="mydb",          # Hostname of the MySQL container
        user="root",          # Username
        passwd="my-secret-pw",# Password
        db="mysql"            # Database name
    )

    cur = db.cursor()
    cur.execute("SELECT VERSION()")
    version = cur.fetchone()
    return f'Hello, World! MySQL version: {version[0]}'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)

Ì∞ã Dockerfile (Multi-Stage Build)

# stage 1: Build stage
FROM python:3.8-slim AS build

WORKDIR /app

RUN apt-get update && apt-get install -y \
    gcc \
    python3-dev \
    libmariadb-dev \
    pkg-config

COPY . .

RUN pip install flask mysqlclient

# stage 2: Production stage
FROM python:3.8-slim

WORKDIR /app

COPY --from=build /app /app

EXPOSE 5000

CMD ["python", "app.py"]

Ì∑† Why multi-stage?

The first stage installs dependencies and compiles native modules.

The second stage copies only what‚Äôs needed, reducing image size.

‚öôÔ∏è  Docker Compose Configuration

version: '3.8'

services:
  web:
    image: my-flask-app:multistage
    ports:
      - "5000:5000"
    depends_on:
      - mydb

  mydb:
    image: mysql:5.7
    environment:
      MYSQL_ROOT_PASSWORD: my-secret-pw


Ì∑© How it works:

The web service runs your Flask app on port 5000.

The mydb service runs a MySQL 5.7 database with a root password.

Ì∫Ä How to Run the Project

1.Build and run containers

docker-compose up --build

2.Access the app
Open your browser and go to:
Ì±â http://localhost:5000

3.Stop the containers
docker-compose down

Ì∑∞ Useful Docker Commands

docker ps                          # List running containers
docker-compose logs web            # View Flask logs
docker exec -it <container_id> sh  # Enter a running container
docker-compose up -d               # Run containers in detached mode


Ì∑© Key Learnings

How to connect Flask with MySQL inside Docker.

How to use multi-stage builds for smaller, cleaner images.

How to define multi-container dependencies with docker-compose.

Managing container networking (Flask ‚Üî MySQL via service names).


Ìºü Future Improvements

Add Nginx as a reverse proxy for Flask.

Add persistent storage for MySQL data using volumes.

Extend Flask routes for CRUD operations.


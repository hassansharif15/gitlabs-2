# 🐳 Flask + MySQL with Docker (Multi-Stage Build)

> A production-ready containerized Flask application with MySQL integration using Docker Compose and optimized multi-stage builds

## 📋 Overview

This project demonstrates best practices for containerizing a Flask application that connects to a MySQL database. It showcases:
- **Docker Compose** for multi-container orchestration
- **Multi-stage Dockerfile** for optimized image size
- **Container networking** between services

The app runs a simple Flask API that connects to MySQL and displays the database version.

---

## 📁 Project Structure

```
hello_flask/
├── app.py                # Flask application with MySQL connection
├── Docker-compose.yml    # Multi-container configuration
├── Dockerfile            # Multi-stage build configuration
└── README.md             # Documentation
```

---

## 🛠️ Technologies Used

| Technology | Version | Purpose |
|-----------|---------|---------|
| **Python** | 3.8 | Flask application runtime |
| **Flask** | Latest | Web framework |
| **MySQL** | 5.7 | Database |
| **Docker** | Latest | Containerization |
| **Docker Compose** | 3.8 | Container orchestration |

---

## 💻 Code Examples

### Flask Application (`app.py`)

```python
from flask import Flask
import MySQLdb

app = Flask(__name__)

@app.route('/')
def hello_world():
    # Connect to the MySQL database
    db = MySQLdb.connect(
        host="mydb",             # Service name from docker-compose
        user="root",
        passwd="my-secret-pw",
        db="mysql"
    )

    cur = db.cursor()
    cur.execute("SELECT VERSION()")
    version = cur.fetchone()
    return f'Hello, World! MySQL version: {version[0]}'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
```

### Multi-Stage Dockerfile

```dockerfile
# Stage 1: Build stage (compile dependencies)
FROM python:3.8-slim AS build

WORKDIR /app

RUN apt-get update && apt-get install -y \
    gcc \
    python3-dev \
    libmariadb-dev \
    pkg-config

COPY . .
RUN pip install flask mysqlclient

# Stage 2: Production stage (minimal runtime)
FROM python:3.8-slim

WORKDIR /app

COPY --from=build /app /app

EXPOSE 5000

CMD ["python", "app.py"]
```

#### Why Multi-Stage?

✅ **Stage 1** installs build tools and compiles native modules  
✅ **Stage 2** copies only the compiled artifacts, reducing final image size  
✅ **Result** Smaller, faster, production-ready images  

### Docker Compose Configuration

```yaml
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
```

**Service Details:**
- `web` - Flask application running on port 5000
- `mydb` - MySQL 5.7 database with secure root password

---

## 🚀 Quick Start

### 1. Build and Run

```bash
docker-compose up --build
```

### 2. Access the Application

Open your browser and navigate to:
```
http://localhost:5000
```

### 3. Stop the Containers

```bash
docker-compose down
```

---

##  Useful Docker Commands

| Command | Purpose |
|---------|---------|
| `docker ps` | List running containers |
| `docker-compose logs web` | View Flask application logs |
| `docker exec -it <container_id> sh` | Access container shell |
| `docker-compose up -d` | Run in detached mode (background) |
| `docker images` | List all images |

---

##  Key Learning Points

- ✅ Connecting Flask applications to MySQL inside Docker
- ✅ Multi-stage Docker builds for optimized image sizes
- ✅ Defining multi-container dependencies with Docker Compose
- ✅ Container networking using service names (Flask ↔ MySQL)
- ✅ Best practices for production-ready containerization

---

##  Future Improvements

-  Add Nginx as a reverse proxy for Flask
-  Implement persistent MySQL data storage with volumes
-  Extend Flask with CRUD operations
-  Add health checks to Docker Compose
-  Implement environment variables for secrets management
-  Add automated testing in the CI/CD pipeline

---

##  Notes

- Service names in Docker Compose (`mydb`) are automatically resolvable hostnames
- Multi-stage builds reduce image size significantly (typically 60-70% smaller)
- Never expose sensitive credentials in production - use secrets management

---

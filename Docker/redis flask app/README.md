# 🚀 Flask + Redis with Nginx Reverse Proxy

> A production-ready containerized Flask application with Redis for session/state management and Nginx as a reverse proxy

## 📋 Overview

This project demonstrates a professional, scalable three-tier architecture:
- **Flask API** serving dynamic endpoints with persistent state
- **Redis** for fast in-memory data storage and session management
- **Nginx** as a reverse proxy for load balancing and request routing

The application tracks page visits using Redis and demonstrates container networking, service dependencies, and reverse proxy configuration.

---

## 📁 Project Structure

```
redis flask app/
├── count.py              # Flask application with Redis integration
├── dockerfile            # Container image specification for Flask app
├── docker-compose.yml    # Multi-service orchestration configuration
├── nginx.conf            # Nginx reverse proxy configuration
└── README.md             # Documentation
```

---

##  Technologies Used

| Technology | Version | Purpose |
|-----------|---------|---------|
| **Python** | 3.8 | Flask application runtime |
| **Flask** | Latest | Web framework for API endpoints |
| **Redis** | Latest | In-memory data store for visit tracking |
| **Nginx** | Latest | Reverse proxy & request router |
| **Docker** | Latest | Containerization |
| **Docker Compose** | 3.8+ | Multi-container orchestration |

---


```
##  Code Examples

### Flask Application (`count.py`)

```python
import os
from flask import Flask
import redis

app = Flask(__name__)

# Configuration from environment variables
redis_host = os.getenv('REDIS_HOST', 'redis')
redis_port = int(os.getenv('REDIS_PORT', 6379))
r = redis.Redis(host=redis_host, port=redis_port)

@app.route('/')
def welcome():
    return 'Welcome to the CoderCo Container Challenge'

@app.route('/count')
def count():
    count = r.incr('visits')  # Increment and retrieve counter
    return f'This page has been visited {count} times.'

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5002)
```

**Key Features:**
- ✅ Environment variable configuration for Redis connection
- ✅ Non-blocking Redis increment operation
- ✅ RESTful endpoint design
- ✅ Service-to-service communication via service names

### Dockerfile

```dockerfile
FROM python:3.8-slim

WORKDIR /app

COPY . .

RUN pip install flask redis

EXPOSE 5002

CMD ["python", "count.py"]
```

**Optimizations:**
- Uses lightweight `slim` base image
- Minimal dependencies (only Flask and Redis)
- Explicit port exposure

### Docker Compose Configuration

```yaml
version: '3.8'

services:
  web:
    build: .                    # Build from local Dockerfile
    expose:
      - "5002"                  # Internal port
    depends_on:
      - redis                   # Wait for Redis
    environment:
      - REDIS_HOST=redis        # Service name resolution
      - REDIS_PORT=6379

  redis:
    image: "redis:latest"
    ports:
      - "6379:6379"
    volumes:
      - redis-data:/data        # Persistent storage

  nginx:
    image: nginx:latest
    ports:
      - "5002:5002"             # Public interface
    volumes:
      - ./nginx.conf:/etc/nginx/nginx.conf
    depends_on:
      - web                     # Wait for Flask app

volumes:
  redis-data:                   # Named volume for Redis data
```

### Nginx Configuration (`nginx.conf`)

```nginx
events {}

http {
    # Upstream server definition
    upstream flask_app {
        server web:5002;
    }

    server {
        listen 5002;

        location / {
            proxy_pass http://flask_app;
        }
    }
}
```

**Purpose:**
- Routes all incoming traffic to the Flask application
- Enables horizontal scaling (add more `server` entries)
- Handles SSL termination (can be extended)

---

## 🚀 Quick Start

### 1. Build and Start Services

```bash
docker-compose up --build
```

### 2. Test the Application

**Welcome endpoint:**
```bash
curl http://localhost:5002/
```

**Visit counter endpoint:**
```bash
curl http://localhost:5002/count
curl http://localhost:5002/count
curl http://localhost:5002/count
```

Each request increments the visit counter stored in Redis.

### 3. Stop the Services

```bash
docker-compose down
```

---

## 📊 Useful Docker Commands

| Command | Purpose |
|---------|---------|
| `docker-compose up --build` | Build and start all services |
| `docker-compose logs web` | View Flask application logs |
| `docker-compose logs redis` | View Redis logs |
| `docker-compose logs nginx` | View Nginx logs |
| `docker exec -it <container_id> redis-cli` | Interactive Redis CLI |
| `docker-compose down -v` | Stop and remove volumes |
| `docker-compose ps` | List running services |

---

## 🔍 Debugging & Monitoring

### Check Redis Data

```bash
# Enter Redis container
docker exec -it redis-cli

# View all keys
KEYS *

# Get visit counter
GET visits

# Reset counter
DEL visits
```

### View Service Logs

```bash
# All services
docker-compose logs -f

# Specific service
docker-compose logs -f nginx
docker-compose logs -f web
docker-compose logs -f redis
```

### Verify Service Connectivity

```bash
# Check if Flask app is accessible
docker-compose exec web curl http://localhost:5002/

# Check Redis connectivity from Flask
docker-compose exec web redis-cli -h redis ping
```

---

## 📚 Key Learning Points

- ✅ **Service-to-Service Communication**: Services communicate via Docker DNS using service names
- ✅ **Reverse Proxy Pattern**: Nginx acts as a single entry point for client requests
- ✅ **Environment Variables**: Configuration managed through Docker Compose environment section
- ✅ **Volume Persistence**: Redis data persists across container restarts
- ✅ **Service Dependencies**: `depends_on` ensures proper startup order
- ✅ **Port Exposure**: `expose` for internal, `ports` for external communication

---

## 🔮 Future Enhancements

-  Add Redis authentication with password protection
-  Implement connection pooling for Redis
-  Add SSL/TLS support to Nginx
-  Scale Flask with multiple replicas and load balancing
-  Add health checks to Docker Compose
-  Implement database for persistent storage
-  Add monitoring with Prometheus and Grafana
-  Create Kubernetes manifests for orchestration

---



**For Production:**
- Secure Redis with authentication (`requirepass` directive)
- Use environment secrets instead of hardcoded values
- Enable SSL/TLS on Nginx
- Implement rate limiting in Nginx
- Run containers with minimal privileges
- Use a reverse proxy with WAF capabilities

---

## 📝 Architecture Benefits

| Benefit | Why |
|---------|-----|
| **Scalability** | Nginx can load balance across multiple Flask instances |
| **Performance** | Redis provides sub-millisecond response times |
| **Resilience** | Services isolated in containers; easy to restart |
| **Maintainability** | Clear separation of concerns (API, cache, proxy) |
| **Flexibility** | Easy to add services or replace components |

---



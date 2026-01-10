# CI/CD

CI/CD stands for Continuous Integration and Continuous Delivery/Deployment. It is a workflow that automates how code changes are built, tested, and shipped. In DevOps, CI/CD helps teams release software faster, with fewer errors, by making deployments repeatable and consistent.

---

## What CI/CD is used for in DevOps

CI/CD is commonly used to:

- Automatically run checks when code changes (linting, tests, security scans)
- Build application artifacts (Docker images, binaries, packages)
- Store artifacts in registries (e.g., Docker Hub, AWS ECR)
- Deploy changes to environments (dev, staging, production)
- Reduce manual steps and prevent “works on my machine” issues
- Improve reliability through consistent pipelines and approvals

---

## Typical CI/CD pipeline stages

A standard pipeline often follows these stages:

1. **Trigger**  
   A push to a branch or a pull request triggers the pipeline.

2. **Checkout**  
   The pipeline runner pulls the latest code.

3. **Install / Setup**  
   Dependencies and tools are installed (e.g., Python packages, Docker).

4. **Test / Validate**  
   Unit tests, formatting, linting, and security checks run automatically.

5. **Build**  
   Artifacts are created (e.g., Docker image build).

6. **Publish**  
   Artifacts are pushed to a registry.

7. **Deploy**  
   Deploy to a target environment (optional approvals for production).

8. **Verify / Monitor**  
   Health checks and monitoring confirm the deployment is working.

---

Common CI/CD concepts and tools
Concepts

Runner: the machine that executes pipeline steps

Pipeline: the end-to-end automated workflow

Jobs and steps: units of work executed in order

Artifacts: build outputs stored for later stages

Environments: dev, staging, production separation

Secrets: secure values like tokens and keys stored in CI/CD secret managers

Tools

GitHub Actions, GitLab CI, Jenkins, CircleCI

Docker for repeatable builds

Container registries (Docker Hub, GitHub Container Registry, AWS ECR)

Infrastructure automation tools (Terraform, Ansible)

Cloud deployment targets (AWS ECS/EKS, Kubernetes, VMs)

How to run locally

From inside the CICD/ folder:

python3 app.py


Build and run the Docker container:

docker build -t cicd-app .
docker run --rm cicd-app

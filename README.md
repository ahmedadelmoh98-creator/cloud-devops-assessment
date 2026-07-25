# Cloud DevOps Assessment

A production-style Cloud DevOps project demonstrating Infrastructure as Code, Containerization, CI/CD, and AWS deployment using modern DevOps practices.

---

## Project Overview

This project provisions a complete cloud infrastructure on AWS using Terraform, deploys a Flask backend on Amazon ECS Fargate, hosts a static frontend on Amazon S3, and automates the deployment process using GitHub Actions.

---

## Architecture

The architecture includes:

- Amazon VPC
- Public & Private Subnets
- Internet Gateway
- NAT Gateway
- Application Load Balancer
- Amazon ECS Fargate
- Amazon ECR
- Amazon RDS PostgreSQL
- Amazon S3 Static Website
- Amazon CloudWatch
- GitHub Actions CI/CD

---

## Technologies Used

| Category | Technologies |
|----------|--------------|
| Cloud | AWS |
| IaC | Terraform |
| Containers | Docker |
| Container Orchestration | Amazon ECS Fargate |
| Database | PostgreSQL (Amazon RDS) |
| Registry | Amazon ECR |
| Monitoring | CloudWatch |
| CI/CD | GitHub Actions |
| Language | Python (Flask) |

---

## Project Structure

```
cloud-devops-assessment/
│
├── app/
│   ├── backend/
│   └── frontend/
│
├── terraform/
│
├── .github/
│   └── workflows/
│
└── README.md
```

---

## CI/CD Pipeline

Every push to the **main** branch automatically performs:

- Checkout source code
- Install Python dependencies
- Run unit tests
- Authenticate to AWS
- Build Docker image
- Push image to Amazon ECR
- Deploy latest image to Amazon ECS
- Wait until the ECS service becomes stable

---

## Infrastructure

Terraform provisions:

- VPC
- Networking
- Security Groups
- ECS Cluster
- ECS Service
- Application Load Balancer
- RDS PostgreSQL
- Amazon ECR Repository
- S3 Static Website
- CloudWatch Log Group
- IAM Roles

---

## Backend Endpoints

| Endpoint | Description |
|----------|-------------|
| `/` | Home |
| `/health` | Health Check |
| `/database` | Database Connectivity Test |

---

## Screenshots

Screenshots will be added here.

---

## 📊 Architecture Diagram

Architecture diagram will be added here.

---

##‍💻 Author

Ahmed Adel

Cloud / DevOps Engineer

GitHub:
https://github.com/ahmedadelmoh98-creator

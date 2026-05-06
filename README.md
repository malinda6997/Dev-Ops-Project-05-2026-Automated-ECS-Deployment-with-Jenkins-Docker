# Apple Website DevOps Project

A modern, fully containerized Apple iPhone showcase application built with React, Three.js, and deployed on AWS ECS. This project demonstrates a complete DevOps workflow from development to production deployment on AWS infrastructure.

## 📋 Table of Contents

- [Project Overview](#project-overview)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Architecture](#architecture)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Development](#development)
- [Building](#building)
- [Docker Deployment](#docker-deployment)
- [AWS ECS Deployment](#aws-ecs-deployment)
- [Screenshots](#screenshots)
- [Contributing](#contributing)

## 🎯 Project Overview

This is a DevOps-enabled Apple website showcase that displays iPhone features with interactive 3D models and smooth animations. The application is containerized using Docker and deployed on AWS ECS (Elastic Container Service), demonstrating a complete CI/CD pipeline and cloud deployment strategy.

**Key DevOps Features:**
- Multi-stage Docker builds for optimized images
- AWS ECR (Elastic Container Registry) integration
- ECS task definition with proper logging configuration
- Health checks and auto-scaling ready architecture
- CloudWatch logging integration

## ✨ Features

- **Interactive 3D Models**: React Three Fiber integration for stunning 3D iPhone visualization
- **Smooth Animations**: GSAP-powered animations for fluid user interactions
- **Responsive Design**: Tailwind CSS for mobile-first responsive layout
- **Performance Monitoring**: Sentry integration for error tracking
- **Modern Build Tool**: Vite for fast development and optimized production builds
- **Container Ready**: Docker multi-stage builds for production-optimized images
- **Cloud Deployment**: AWS ECS deployment with CloudWatch logging

## 🏗️ Tech Stack

### Frontend
- **React**: 18.2.0 - UI library
- **Vite**: 5.1.4 - Next-generation build tool
- **Three.js**: 0.162.0 - 3D graphics
- **React Three Fiber**: 8.15.19 - React renderer for Three.js
- **GSAP**: 3.12.5 - Animation library
- **Tailwind CSS**: 3.4.1 - Utility-first CSS framework

### DevOps & Infrastructure
- **Docker**: Multi-stage builds for optimization
- **Nginx**: Web server for serving static files
- **AWS ECS**: Container orchestration
- **AWS ECR**: Container registry
- **CloudWatch**: Logging and monitoring

### Development Tools
- **ESLint**: Code quality and linting
- **PostCSS**: CSS transformation
- **Autoprefixer**: CSS vendor prefixes
- **Sentry**: Error tracking and performance monitoring

## 🏛️ Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                    Client Browser                            │
└──────────────────────────┬──────────────────────────────────┘
                           │
                           ▼
┌─────────────────────────────────────────────────────────────┐
│           AWS ECS Cluster (us-east-1)                       │
│  ┌────────────────────────────────────────────────────────┐ │
│  │  ECS Task: apple-website-task                          │ │
│  │  ┌──────────────────────────────────────────────────┐  │ │
│  │  │  Container: apple-app-container                 │  │ │
│  │  │  ┌──────────────────────────────────────────┐   │  │ │
│  │  │  │  Nginx (Port 80)                         │   │  │ │
│  │  │  │  └─► Vite Static Build (dist/)          │   │  │ │
│  │  │  └──────────────────────────────────────────┘   │  │ │
│  │  └──────────────────────────────────────────────────┘  │ │
│  │             ▼ CloudWatch Logs                          │ │
│  │  /ecs/apple-website-task                              │ │
│  └────────────────────────────────────────────────────────┘ │
└─────────────────────────────────────────────────────────────┘
                           ▲
                           │
┌──────────────────────────────────────────────────────────────┐
│              AWS ECR Repository (us-east-1)                  │
│   460678531463.dkr.ecr.us-east-1.amazonaws.com/             │
│   apple-website-project:latest                              │
└──────────────────────────────────────────────────────────────┘
```

## 📋 Prerequisites

- **Node.js**: v18 or higher (for local development)
- **npm**: v9 or higher
- **Docker**: v20.0+ (for containerization)
- **Docker Desktop** or Docker CLI with daemon running
- **AWS Account** with proper IAM permissions (for ECS deployment)
- **AWS CLI**: Configured with appropriate credentials

### AWS Requirements (for deployment)
- AWS ECR repository created
- ECS cluster configured
- ECS task execution role with appropriate permissions
- CloudWatch log groups configured

## 📦 Installation

### 1. Clone the Repository

```bash
git clone <repository-url>
cd iphone
```

### 2. Install Dependencies

```bash
npm install
```

### 3. Verify Installation

```bash
npm run lint
```

## 🚀 Development

### Start Development Server

```bash
npm run dev
```

The application will be available at `http://localhost:5173`

### Available Development Scripts

```bash
# Start development server with hot reload
npm run dev

# Build for production
npm run build

# Preview production build locally
npm run preview

# Run ESLint to check code quality
npm run lint
```

## 🔨 Building

### Local Build

```bash
npm run build
```

This creates a production-optimized build in the `dist/` folder.

### Preview Build

```bash
npm run preview
```

This serves the production build locally for testing.

## 🐳 Docker Deployment

### Build Docker Image

```bash
# Build with a specific tag
docker build -t apple-website:latest .

# Or with your ECR registry
docker build -t 460678531463.dkr.ecr.us-east-1.amazonaws.com/apple-website-project:latest .
```

### Run Container Locally

```bash
# Run the container
docker run -p 8080:80 apple-website:latest

# Container will be available at http://localhost:8080
```

### Docker Configuration Details

The Dockerfile uses a **multi-stage build** approach:

**Stage 1: Build**
- Uses `node:20-alpine` as base
- Installs dependencies
- Builds the Vite app

**Stage 2: Runtime**
- Uses `nginx:stable-alpine` for minimal image size
- Serves the built application
- Exposes port 80

### Docker Image Optimization

- **Base Images**: Alpine Linux variants for minimal size
- **Multi-stage**: Reduces final image size by ~90%
- **Static Serving**: Nginx efficiently serves static files
- **No Runtime Dependencies**: Build dependencies excluded from final image

## 🌍 AWS ECS Deployment

### Task Definition Overview

**Task Family**: `apple-website-task`
**Container Name**: `apple-app-container`
**Image**: `460678531463.dkr.ecr.us-east-1.amazonaws.com/apple-website-project:latest`

### Container Configuration

- **Port Mapping**: 80 (container) → 80 (host)
- **Protocol**: HTTP
- **CPU**: Dynamic allocation (cpu: 0)
- **Memory**: Defined in task definition
- **Essential**: Yes

### Logging Configuration

- **Log Driver**: AWS CloudWatch Logs
- **Log Group**: `/ecs/apple-website-task`
- **Region**: us-east-1
- **Stream Prefix**: `ecs`
- **Auto-create Log Group**: Enabled

### Deployment Steps

#### 1. Push Image to ECR

```bash
# Login to ECR
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 460678531463.dkr.ecr.us-east-1.amazonaws.com

# Tag image
docker tag apple-website:latest 460678531463.dkr.ecr.us-east-1.amazonaws.com/apple-website-project:latest

# Push to ECR
docker push 460678531463.dkr.ecr.us-east-1.amazonaws.com/apple-website-project:latest
```

#### 2. Register Task Definition

```bash
# Register or update task definition
aws ecs register-task-definition --cli-input-json file://task-definition.json --region us-east-1
```

#### 3. Update ECS Service

```bash
# Force new deployment
aws ecs update-service \
  --cluster your-cluster-name \
  --service your-service-name \
  --force-new-deployment \
  --region us-east-1
```

#### 4. Monitor Deployment

```bash
# Check service status
aws ecs describe-services \
  --cluster your-cluster-name \
  --services your-service-name \
  --region us-east-1

# View CloudWatch logs
aws logs tail /ecs/apple-website-task --follow
```

## 📸 Screenshots

### Dashboard Overview
![ECS Dashboard](public/readme_images/ecs%20page%201.png)

### Application Interface
![Screenshot 1](public/readme_images/Screenshot%202026-05-06%20155742.png)

### Feature Showcase
![Screenshot 2](public/readme_images/Screenshot%202026-05-06%20165602.png)
![Screenshot 3](public/readme_images/Screenshot%202026-05-06%20165627.png)

### 3D Model Interaction
![Screenshot 4](public/readme_images/Screenshot%202026-05-06%20165731.png)

### Responsive Design
![Screenshot 5](public/readme_images/Screenshot%202026-05-06%20165809.png)

## 🛠️ Troubleshooting

### Common Issues

**Docker Build Fails**
- Ensure Docker daemon is running: `docker ps`
- Clear Docker cache: `docker builder prune`
- Verify Node.js dependencies: `npm install` locally first

**ECS Deployment Issues**
- Check CloudWatch logs: `aws logs tail /ecs/apple-website-task`
- Verify task definition: `aws ecs describe-task-definition --task-definition apple-website-task`
- Ensure IAM role has proper permissions

**Application Not Responding**
- Check container logs: `docker logs <container-id>`
- Verify port mappings: `docker port <container-id>`
- Check Nginx configuration inside container

## 📝 Project Structure

```
iphone/
├── src/
│   ├── components/          # React components
│   ├── constants/           # App constants
│   ├── utils/              # Utility functions
│   ├── App.jsx
│   ├── index.css
│   └── main.jsx
├── public/
│   ├── assets/             # Images and videos
│   ├── models/             # 3D models
│   └── readme_images/      # Documentation screenshots
├── Dockerfile              # Multi-stage Docker build
├── task-definition.json    # AWS ECS task definition
├── vite.config.js          # Vite configuration
├── tailwind.config.js      # Tailwind CSS configuration
├── postcss.config.js       # PostCSS configuration
├── package.json            # Dependencies and scripts
└── README.md               # This file
```

## 🤝 Contributing

1. **Fork the repository**
2. **Create a feature branch**: `git checkout -b feature/your-feature-name`
3. **Commit changes**: `git commit -m "Add your feature"`
4. **Push to branch**: `git push origin feature/your-feature-name`
5. **Submit a Pull Request**

### Code Quality

- Run ESLint before committing: `npm run lint`
- Ensure no console errors or warnings
- Test locally before pushing

## 📄 License

This project is part of a DevOps learning initiative. Check with your organization for licensing details.

## 📞 Support

For issues, questions, or contributions, please open an issue in the repository.

---

**Last Updated**: May 6, 2026
**Version**: 1.0.0
**Status**: Production Ready

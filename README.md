# iPhone Showcase Application - Apple Website DevOps Project

[![Status](https://img.shields.io/badge/Status-Production%20Ready-brightgreen)](#)
[![Version](https://img.shields.io/badge/Version-1.0.0-blue)](#)
[![License](https://img.shields.io/badge/License-MIT-green)](#license)

A modern, professional-grade containerized Apple iPhone showcase web application featuring interactive 3D models, immersive animations, and cloud deployment on AWS ECS. This project demonstrates enterprise-level DevOps practices with production-ready CI/CD pipeline, comprehensive containerization, and scalable cloud infrastructure.

---

## 📋 Table of Contents

- [Overview](#overview)
- [Key Features](#key-features)
- [Technology Stack](#technology-stack)
- [System Architecture](#system-architecture)
- [Prerequisites](#prerequisites)
- [Installation Guide](#installation-guide)
- [Development Workflow](#development-workflow)
- [Production Build](#production-build)
- [Docker Deployment](#docker-deployment)
- [AWS ECS Deployment](#aws-ecs-deployment)
- [Project Structure](#project-structure)
- [Component Reference](#component-reference)
- [Deployment Verification](#deployment-verification)
- [Troubleshooting Guide](#troubleshooting-guide)
- [Contributing Guidelines](#contributing-guidelines)
- [License](#license)
- [Support](#support)

---

## Overview

This is an enterprise-level DevOps project showcasing a modern web application built with React and Three.js, displaying iPhone features with stunning 3D visualization and smooth animations. The project demonstrates complete DevOps workflow from development through production deployment on AWS infrastructure.

### Project Highlights

- **Interactive 3D Visualization** - React Three Fiber integration for immersive iPhone model viewer
- **Smooth Animations** - GSAP-powered transitions for exceptional UX
- **Responsive Design** - Mobile-first approach with Tailwind CSS
- **Cloud-Native** - Docker containerization with AWS ECS orchestration
- **Production-Ready** - Comprehensive logging, monitoring, and error tracking
- **DevOps Best Practices** - Multi-stage builds, auto-scaling architecture, CloudWatch integration
- **Performance Optimized** - Vite build tool with code splitting and asset optimization

---

## Key Features

| Feature | Description |
|---------|-------------|
| **3D Model Viewer** | React Three Fiber integration for interactive iPhone model visualization |
| **Animations** | GSAP-powered smooth animations and transitions throughout the application |
| **Responsive Layout** | Tailwind CSS utility-first framework for mobile-first responsive design |
| **Video Carousel** | Showcase iPhone capabilities through curated video content |
| **Performance Tracking** | Sentry integration for real-time error monitoring and performance metrics |
| **Fast Build Tool** | Vite for rapid development cycles and optimized production builds |
| **Docker Ready** | Multi-stage Docker builds optimized for minimal image size and maximum efficiency |
| **AWS Integration** | ECS task orchestration with CloudWatch logging and monitoring |
| **Auto-Scaling** | Architecture supports horizontal scaling and load balancing |

---

## Technology Stack

### Frontend Framework & Libraries
| Technology | Version | Purpose |
|-----------|---------|---------|
| **React** | 18.2.0+ | UI library and component framework |
| **Vite** | 5.1.4+ | Next-generation build tool for optimized builds |
| **Three.js** | 0.162.0+ | 3D graphics and WebGL rendering |
| **React Three Fiber** | 8.15.19+ | React renderer for Three.js |
| **GSAP** | 3.12.5+ | Professional animation library |
| **Tailwind CSS** | 3.4.1+ | Utility-first CSS framework |

### Styling & Build Tools
| Technology | Purpose |
|-----------|---------|
| **PostCSS** | CSS transformation and processing |
| **Autoprefixer** | CSS vendor prefix automation |
| **ESLint** | Code quality and linting |

### DevOps & Infrastructure
| Service | Purpose |
|---------|---------|
| **Docker** | Container virtualization with multi-stage builds |
| **Nginx** | Lightweight web server for static file serving |
| **AWS ECS** | Container orchestration and management |
| **AWS ECR** | Private container image registry |
| **AWS CloudWatch** | Centralized logging and monitoring |
| **AWS IAM** | Identity and access management |

---

## System Architecture

### High-Level Architecture Diagram

```
┌─────────────────────────────────────────────────────────────┐
│                    Client Browser Layer                      │
│              (Chrome, Firefox, Safari, Edge)                │
└──────────────────────────────┬──────────────────────────────┘
                               │
                               ▼
┌─────────────────────────────────────────────────────────────┐
│              AWS CloudFront / ALB (Optional)                 │
│            (Global Edge Locations / Load Balancing)         │
└──────────────────────────────┬──────────────────────────────┘
                               │
                               ▼
┌─────────────────────────────────────────────────────────────┐
│        AWS ECS Cluster (Region: us-east-1)                  │
│  ┌──────────────────────────────────────────────────────┐   │
│  │  ECS Service: apple-website-service                  │   │
│  │  ┌────────────────────────────────────────────────┐  │   │
│  │  │  ECS Task: apple-website-task (v1)             │  │   │
│  │  │  ┌──────────────────────────────────────────┐  │  │   │
│  │  │  │  Container: apple-app-container          │  │  │   │
│  │  │  │  ┌────────────────────────────────────┐  │  │  │   │
│  │  │  │  │  Nginx Web Server (Port 80)        │  │  │  │   │
│  │  │  │  │  └─► React Vite Build (dist/)      │  │  │  │   │
│  │  │  │  │  └─► Three.js 3D Assets           │  │  │  │   │
│  │  │  │  │  └─► Static Resources             │  │  │  │   │
│  │  │  │  └────────────────────────────────────┘  │  │  │   │
│  │  │  └──────────────────────────────────────────┘  │  │   │
│  │  │             ▼ Health Checks (Port 80)         │  │   │
│  │  └────────────────────────────────────────────────┘  │   │
│  │                                                        │   │
│  │  ECS Task: apple-website-task (v2) [Scaled]          │   │
│  │  ┌────────────────────────────────────────────────┐  │   │
│  │  │  [Similar container configuration]             │  │   │
│  │  └────────────────────────────────────────────────┘  │   │
│  └──────────────────────────────────────────────────────┘   │
│                                                               │
│  Logging & Monitoring                                        │
│  ┌──────────────────────────────────────────────────────┐   │
│  │  CloudWatch Log Group: /ecs/apple-website-task       │   │
│  │  - Container Logs                                    │   │
│  │  - Performance Metrics                               │   │
│  │  - Error Tracking (Sentry Integration)              │   │
│  └──────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────┘
                               ▲
                               │
┌──────────────────────────────────────────────────────────────┐
│     AWS Elastic Container Registry (ECR)                     │
│     URI: 460678531463.dkr.ecr.us-east-1.amazonaws.com       │
│     Repository: apple-website-project:latest                │
│     - Image Scanning enabled                                 │
│     - Lifecycle policies configured                          │
└──────────────────────────────────────────────────────────────┘
```

### Data Flow

```
Developer Commits Code
        │
        ▼
GitHub/GitLab Repository
        │
        ▼
CI/CD Pipeline (GitHub Actions / CodePipeline)
        │
        ├─► npm install
        ├─► npm run lint
        ├─► npm run build
        │
        ▼
Docker Build (Multi-Stage)
        │
        ├─► Stage 1: Build (Node Alpine)
        │   └─► npm install & build Vite app
        │
        ├─► Stage 2: Runtime (Nginx Alpine)
        │   └─► Copy dist/ to Nginx
        │
        ▼
AWS ECR Push
        │
        ▼
ECS Deployment
        │
        ▼
CloudWatch Monitoring & Logging
```

---

## Prerequisites

### Local Development
- **Node.js**: v18.0.0 or higher - [Download](https://nodejs.org/)
- **npm**: v9.0.0 or higher (comes with Node.js)
- **Git**: v2.25.0 or higher - [Download](https://git-scm.com/)
- **Code Editor**: VS Code, WebStorm, or similar

### Docker & Containerization
- **Docker Desktop**: v20.0+ or Docker CLI - [Download](https://www.docker.com/products/docker-desktop)
- **Docker Daemon**: Running and accessible
- **4GB+ RAM**: Recommended for smooth Docker operations

### AWS Deployment
- **AWS Account** with appropriate permissions
- **AWS CLI**: v2.0+ configured with credentials
- **IAM Permissions**: 
  - ECR: CreateRepository, DescribeRepositories, GetAuthorizationToken
  - ECS: DescribeClusters, DescribeServices, UpdateService, ListTasks
  - CloudWatch: PutLogEvents, CreateLogGroup
  - IAM: PassRole

### Verification Commands
```bash
# Verify Node.js
node --version

# Verify npm
npm --version

# Verify Docker
docker --version
docker ps

# Verify AWS CLI
aws --version
aws sts get-caller-identity
```

---

## Installation Guide

### Step 1: Clone Repository

```bash
git clone https://github.com/your-org/apple-website.git
cd iphone
```

### Step 2: Install Node Dependencies

```bash
npm install
```

This installs all required packages listed in `package.json`:
- React and related libraries
- Vite and build tools
- Three.js and animation libraries
- Tailwind CSS and styling tools

### Step 3: Environment Configuration

Create `.env` file in project root:

```env
# Development environment
VITE_ENVIRONMENT=development
VITE_API_URL=http://localhost:3000
VITE_DEBUG_MODE=true

# Production environment (uncomment for production)
# VITE_ENVIRONMENT=production
# VITE_API_URL=https://api.example.com
# VITE_DEBUG_MODE=false
```

### Step 4: Verify Installation

```bash
npm run lint
npm run build --dry-run
```

---

## Development Workflow

### Start Development Server

```bash
npm run dev
```

**Output:**
```
  Local:        http://localhost:5173/
  Press 'q' to quit
```

### Development Features
- Hot Module Replacement (HMR) for instant updates
- Source maps for debugging
- Development console output
- Automatic browser refresh

### Available Development Commands

```bash
# Development server with HMR
npm run dev

# Production build
npm run build

# Preview production build locally
npm run preview

# Lint code with ESLint
npm run lint

# Format code (if configured)
npm run format
```

---

## Production Build

### Build Optimization

```bash
npm run build
```

**Output structure:**
```
dist/
├── index.html           # Main HTML file
├── assets/
│   ├── app-[hash].js   # Application JavaScript
│   ├── vendor-[hash].js # Vendor dependencies
│   └── style-[hash].css # Compiled CSS
├── models/              # 3D model files
└── icons/               # Favicon and icons
```

### Preview Production Build

```bash
npm run preview
```

Serves production build locally at `http://localhost:4173`

### Build Statistics

The build output includes:
- Bundle size analysis
- Asset gzip compression ratio
- Build time metrics
- Code splitting analysis

---

## Docker Deployment

### Build Docker Image

#### Option 1: Basic Build

```bash
docker build -t apple-website:latest .
```

#### Option 2: ECR Build

```bash
docker build -t 460678531463.dkr.ecr.us-east-1.amazonaws.com/apple-website-project:latest .
```

#### Option 3: Build with Build Arguments

```bash
docker build \
  --build-arg NODE_ENV=production \
  -t apple-website:latest .
```

### Run Container Locally

#### Basic Execution

```bash
docker run -p 8080:80 apple-website:latest
```

Access at `http://localhost:8080`

#### With Environment Variables

```bash
docker run \
  -p 8080:80 \
  -e VITE_ENVIRONMENT=production \
  apple-website:latest
```

#### With Volume Mounting (Development)

```bash
docker run \
  -p 8080:80 \
  -v $(pwd)/dist:/usr/share/nginx/html \
  apple-website:latest
```

### Dockerfile Details

#### Multi-Stage Build Strategy

**Stage 1: Build Stage**
```dockerfile
FROM node:20-alpine
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production
COPY . .
RUN npm run build
```

- Installs dependencies
- Builds Vite application
- Optimizes for production

**Stage 2: Runtime Stage**
```dockerfile
FROM nginx:stable-alpine
COPY --from=builder /app/dist /usr/share/nginx/html
EXPOSE 80
```

- Minimal image size (~50MB)
- Serves static files efficiently
- Production-ready configuration

### Image Optimization

| Optimization | Benefit |
|-------------|---------|
| Multi-stage builds | 90% size reduction vs single-stage |
| Alpine Linux base | Minimal attack surface |
| npm ci instead of npm install | Deterministic builds |
| Production dependencies only | Smaller runtime image |
| Nginx serving | Efficient static file delivery |

### Docker Commands Reference

```bash
# View image details
docker images apple-website:latest

# View running containers
docker ps

# View container logs
docker logs <container-id>

# Access container shell
docker exec -it <container-id> /bin/sh

# Stop container
docker stop <container-id>

# Remove image
docker rmi apple-website:latest

# Clean up unused images and containers
docker system prune -a
```

---

## AWS ECS Deployment

### Prerequisites Checklist

- [ ] AWS Account created and configured
- [ ] AWS CLI installed and credentials configured
- [ ] ECR repository created
- [ ] ECS cluster provisioned
- [ ] IAM roles and policies configured
- [ ] CloudWatch log groups created
- [ ] Application tested locally with Docker

### Task Definition Configuration

**Task Family**: `apple-website-task`
**Container Name**: `apple-app-container`
**Image URI**: `460678531463.dkr.ecr.us-east-1.amazonaws.com/apple-website-project:latest`

#### Container Configuration Details

```json
{
  "name": "apple-app-container",
  "image": "460678531463.dkr.ecr.us-east-1.amazonaws.com/apple-website-project:latest",
  "portMappings": [
    {
      "containerPort": 80,
      "protocol": "tcp"
    }
  ],
  "essential": true,
  "logConfiguration": {
    "logDriver": "awslogs",
    "options": {
      "awslogs-group": "/ecs/apple-website-task",
      "awslogs-region": "us-east-1",
      "awslogs-stream-prefix": "ecs"
    }
  }
}
```

### Logging Configuration

- **Log Driver**: AWS CloudWatch Logs
- **Log Group**: `/ecs/apple-website-task`
- **Log Stream**: `ecs/apple-app-container/<task-id>`
- **Retention**: Configurable (default: never expire)
- **Auto-create**: Enabled

### Deployment Process

#### Step 1: Authenticate with ECR

```bash
aws ecr get-login-password --region us-east-1 | \
  docker login --username AWS --password-stdin \
  460678531463.dkr.ecr.us-east-1.amazonaws.com
```

#### Step 2: Tag and Push Image

```bash
# Tag image
docker tag apple-website:latest \
  460678531463.dkr.ecr.us-east-1.amazonaws.com/apple-website-project:latest

# Push to ECR
docker push \
  460678531463.dkr.ecr.us-east-1.amazonaws.com/apple-website-project:latest
```

Monitor push progress - typical size: 50-100MB

#### Step 3: Register Task Definition

```bash
aws ecs register-task-definition \
  --cli-input-json file://task-definition.json \
  --region us-east-1
```

Response includes:
- Task definition ARN
- Revision number
- Status (ACTIVE)

#### Step 4: Update ECS Service

```bash
aws ecs update-service \
  --cluster your-cluster-name \
  --service your-service-name \
  --task-definition apple-website-task:1 \
  --force-new-deployment \
  --region us-east-1
```

#### Step 5: Monitor Deployment

```bash
# Check service status
aws ecs describe-services \
  --cluster your-cluster-name \
  --services your-service-name \
  --region us-east-1 \
  --query 'services[0].[deployments,desiredCount,runningCount]' \
  --output table

# Watch CloudWatch logs
aws logs tail /ecs/apple-website-task --follow

# Get task details
aws ecs list-tasks \
  --cluster your-cluster-name \
  --region us-east-1
```

### Deployment Monitoring

#### CloudWatch Dashboard Setup

View real-time metrics:
- Task count (desired vs running)
- CPU utilization
- Memory usage
- Network I/O
- Container restart count

#### Health Checks

Configure ALB health checks:
- **Path**: `/`
- **Protocol**: HTTP
- **Port**: 80
- **Interval**: 30 seconds
- **Timeout**: 5 seconds
- **Healthy Threshold**: 2
- **Unhealthy Threshold**: 2

### Rollback Procedure

```bash
# Revert to previous task definition
aws ecs update-service \
  --cluster your-cluster-name \
  --service your-service-name \
  --task-definition apple-website-task:0 \
  --force-new-deployment \
  --region us-east-1
```

---

## Project Structure

### Directory Organization

```
iphone/
│
├── src/                              # Source code directory
│   ├── components/                   # React components
│   │   ├── App.jsx                  # Root component
│   │   ├── Navbar.jsx               # Navigation header
│   │   ├── Hero.jsx                 # Hero section
│   │   ├── IPhone.jsx               # iPhone showcase
│   │   ├── Model.jsx                # 3D model component
│   │   ├── ModelView.jsx            # Model viewer wrapper
│   │   ├── Features.jsx             # Features showcase
│   │   ├── Highlights.jsx           # Highlights section
│   │   ├── HowItWorks.jsx           # Tutorial section
│   │   ├── VideoCarousel.jsx        # Video carousel
│   │   ├── Lights.jsx               # 3D lighting setup
│   │   ├── Loader.jsx               # Loading indicator
│   │   └── Footer.jsx               # Footer component
│   │
│   ├── constants/                    # Application constants
│   │   └── index.js                 # Constants definitions
│   │
│   ├── utils/                        # Utility functions
│   │   ├── animations.js            # Animation utilities
│   │   └── index.js                 # General utilities
│   │
│   ├── index.css                    # Global styles
│   └── main.jsx                     # React entry point
│
├── public/                           # Static assets
│   ├── assets/
│   │   ├── images/                  # Image files
│   │   └── videos/                  # Video files
│   ├── models/                       # 3D model files (.gltf, .glb)
│   └── readme_images/               # Documentation images
│
├── node_modules/                    # Dependencies (generated)
├── dist/                            # Production build output (generated)
│
├── .env                             # Environment variables (local)
├── .gitignore                       # Git ignore rules
├── Dockerfile                       # Docker build configuration
├── task-definition.json             # AWS ECS task definition
├── vite.config.js                  # Vite build configuration
├── tailwind.config.js              # Tailwind CSS configuration
├── postcss.config.js               # PostCSS configuration
├── package.json                    # Dependencies and scripts
├── package-lock.json               # Locked dependency versions
└── README.md                        # Project documentation
```

---

## Component Reference

### Core Components

| Component | Purpose | Key Features |
|-----------|---------|--------------|
| **App.jsx** | Root component | Layout, routing, state management |
| **Navbar.jsx** | Header navigation | Logo, menu, responsive nav |
| **Hero.jsx** | Landing section | Headline, CTA buttons, visual impact |
| **IPhone.jsx** | Main showcase | iPhone display, interactive controls |
| **Model.jsx** | 3D rendering | Three.js setup, model loading |
| **ModelView.jsx** | Model viewer | Controls, interactions, camera |
| **Features.jsx** | Feature list | Grid layout, feature cards |
| **Highlights.jsx** | Key specs | Highlights, technical details |
| **HowItWorks.jsx** | Tutorial | Step-by-step guide, visuals |
| **VideoCarousel.jsx** | Media | Video playback, carousel controls |
| **Lights.jsx** | 3D lighting | Ambient light, directional light |
| **Loader.jsx** | Loading UI | Loading indicator, progress |
| **Footer.jsx** | Footer info | Links, copyright, contact |

---

## Deployment Verification

### Health Check Endpoints

```bash
# Application health
curl http://localhost/

# Expected response: 200 OK with HTML content
```

### Container Verification

```bash
# Container is running
docker ps | grep apple-website

# Container logs show no errors
docker logs <container-id> | tail -50

# Port is listening
netstat -an | grep 80
```

### AWS Deployment Verification

```bash
# ECS task is running
aws ecs describe-tasks \
  --cluster your-cluster-name \
  --tasks <task-arn> \
  --region us-east-1 \
  --query 'tasks[0].lastStatus' \
  --output text

# Expected output: RUNNING

# CloudWatch logs are present
aws logs describe-log-streams \
  --log-group-name /ecs/apple-website-task \
  --region us-east-1
```

---

## Troubleshooting Guide

### Common Issues & Solutions

#### Docker Issues

**Issue**: Docker daemon not running
```bash
# Solution
docker ps
# If error: Start Docker Desktop or daemon
```

**Issue**: Image build fails
```bash
# Solution
docker builder prune  # Clear build cache
docker build --no-cache -t apple-website:latest .
```

**Issue**: Container won't start
```bash
# Solution
docker logs <container-id>  # Check error messages
docker run -it apple-website:latest /bin/sh  # Debug interactively
```

#### npm Issues

**Issue**: Dependencies not installing
```bash
# Solution
rm -rf node_modules package-lock.json
npm cache clean --force
npm install
```

**Issue**: Module not found errors
```bash
# Solution
npm install --force
npm run build  # Verify build works
```

#### AWS Deployment Issues

**Issue**: ECR login fails
```bash
# Solution
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin <account-id>.dkr.ecr.us-east-1.amazonaws.com
```

**Issue**: ECS task fails to start
```bash
# Check logs
aws logs tail /ecs/apple-website-task --follow

# Check task definition
aws ecs describe-task-definition --task-definition apple-website-task

# Check IAM permissions
aws iam get-role --role-name ecsTaskExecutionRole
```

### Performance Optimization

#### Build Time Optimization
- Use `npm ci` instead of `npm install` in CI/CD
- Cache node_modules in Docker builds
- Use `--only=production` for production builds

#### Runtime Optimization
- Enable Gzip compression in Nginx
- Implement browser caching headers
- Use CloudFront CDN for static assets
- Enable ECS auto-scaling based on metrics

---

## Contributing Guidelines

### Development Workflow

1. **Create Feature Branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. **Make Changes**
   - Follow code standards
   - Update tests if applicable
   - Document changes

3. **Verify Code Quality**
   ```bash
   npm run lint
   npm run build
   ```

4. **Commit Changes**
   ```bash
   git commit -m "feat: your feature description"
   ```

5. **Push & Create PR**
   ```bash
   git push origin feature/your-feature-name
   ```

### Code Standards

- Use functional components (React hooks)
- Follow naming conventions (camelCase for variables)
- Document complex logic with comments
- Keep components focused and reusable
- Optimize performance (memoization, lazy loading)

### Testing Requirements

- Unit tests for utilities
- Component tests for UI elements
- Integration tests for features
- Cross-browser testing before deployment

---

## License

This project is licensed under the MIT License. See the LICENSE file for details.

```
MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction...
```

---

## Support

### Getting Help

- **Documentation**: See this README and inline code comments
- **Issues**: Create an issue in the GitHub repository
- **Discussions**: Use GitHub Discussions for questions
- **Email**: development@example.com

### Useful Resources

- [React Documentation](https://react.dev/)
- [Vite Guide](https://vitejs.dev/)
- [Three.js Documentation](https://threejs.org/docs/)
- [Tailwind CSS](https://tailwindcss.com/)
- [AWS ECS Documentation](https://docs.aws.amazon.com/ecs/)
- [Docker Documentation](https://docs.docker.com/)

---

## Project Statistics

- **Framework**: React 18.2.0+
- **Build Tool**: Vite 5.1.4+
- **Docker Image Size**: ~50MB
- **Bundle Size**: ~150-200KB (gzipped)
- **Load Time**: <2 seconds (optimized)
- **Browser Support**: Last 2 versions of major browsers

---

## Changelog

### Version 1.0.0 (Production Release)
- Initial production release
- Complete DevOps pipeline integration
- AWS ECS deployment support
- CloudWatch logging and monitoring
- Multi-stage Docker builds
- Professional documentation

---

## Screenshots & Media

### Deployment Dashboard
![ECS Dashboard](public/readme_images/ecs%20page%201.png)

### AWS Configuration
![AWS Console](public/readme_images/Screenshot%202026-05-06%20155742.png)

### Task Configuration
![Task Config 1](public/readme_images/Screenshot%202026-05-06%20165602.png)
![Task Config 2](public/readme_images/Screenshot%202026-05-06%20165627.png)

### Monitoring & Logs
![CloudWatch Logs](public/readme_images/Screenshot%202026-05-06%20165731.png)

### Service Status
![Service Status](public/readme_images/Screenshot%202026-05-06%20165809.png)

---

## Roadmap

### Future Enhancements
- [ ] Advanced analytics and performance monitoring
- [ ] User customization features
- [ ] A/B testing capabilities
- [ ] Enhanced accessibility (WCAG 2.1 compliance)
- [ ] Performance monitoring dashboard
- [ ] Multi-language support (i18n)
- [ ] Dark mode support
- [ ] Progressive Web App (PWA) features
- [ ] Service Worker caching strategy
- [ ] GraphQL API integration

---

**Last Updated**: May 14, 2026  
**Version**: 1.0.0  
**Status**: ✅ Production Ready  
**Maintained By**: Malinda Prabath  
**Contact**: malindaprabath876@gmail.com

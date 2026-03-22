# Automated CI/CD Pipeline with Security Integration (SonarQube, OWASP, Trivy) and Docker Deployment

## Tools Used
AWS, GitHub, Jenkins, SonarQube, OWASP Dependency Check, Docker, Trivy, Node.js

## Learning Outcomes
- CI/CD pipeline automation using Jenkins  
- Code quality analysis with SonarQube  
- Security scanning with OWASP & Trivy  
- Docker containerization and deployment  
- Real-world DevOps debugging and problem-solving

## Architecture
<img width="307" height="410" alt="devops-project-1 drawio" src="https://github.com/user-attachments/assets/2bc383b4-e6e3-4170-900f-9f220dcd5582" />

### Phase 1: Infrastructure Setup
Set up cloud environment and required ports

Steps
Launch EC2 instance (c7i-flex.large, 20GB storage)
Open ports:
8080 → Jenkins
9000 → SonarQube
3000 → Application


#### Phase 2: Install Required Software

Installed:
OpenJDK 17
Docker
Jenkins

Docker Additional Setup
Added Jenkins user to Docker group
Restarted Jenkins


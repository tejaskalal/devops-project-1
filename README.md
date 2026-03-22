# Automated CI/CD Pipeline with Security Integration (SonarQube, OWASP, Trivy) and Docker Deployment
---
## Tools Used
AWS, GitHub, Jenkins, SonarQube, OWASP Dependency Check, Docker, Trivy, Node.js
---
## Learning Outcomes
- CI/CD pipeline automation using Jenkins  
- Code quality analysis with SonarQube  
- Security scanning with OWASP & Trivy  
- Docker containerization and deployment  
- Real-world DevOps debugging and problem-solving
---
## Architecture
        👨‍💻 Developer
              │
              ▼
        🐙 GitHub
              │
              ▼
        ⚙️ Jenkins (CI/CD)
              │
   ┌──────────┼──────────┐
   ▼          ▼          ▼
🔍 SonarQube  🔐 OWASP   📦 Docker Build
   │          │          │
   └──────────┴──────────┘
              │
              ▼
        🛡️ Trivy Scan
              │
              ▼
        🟧 AWS EC2
              │
              ▼
        🚀 Docker Container (App Running)
---

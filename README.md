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
- 8080 → Jenkins 
- 9000 → SonarQube 
- 3000 → Application


### Phase 2: Install Required Software

Installed:
- OpenJDK 
- Jenkins 
- Docker 

Docker Additional Setup
Added Jenkins user to Docker group
Restarted Jenkins

### Phase 3: SonarQube Setup
Steps
```md
```bash
docker run -d --name sonar -p 9000:9000 sonarqube:lts
```
- Open SonarQube UI: http://instance_ip:9000
- Default login: admin(this is username) / admin(this is pass) (intial credential given by sonarqube using this loged in and update pass)
- Create project: devops-project
- Generate token (click on profile -->Go to myaccount-->security-->generate token (keep it safely)

### Phase 4: Jenkins Configuration

Steps
- Open Jenkins UI; http://instance_ip:8080 (You'll get inital password path , get password from their and logged in . install suggested plugin and setup admin user with new credential)
- Install SonarQube Scanner plugin (manage jenkins-->Plugins-->available plugins-->SonarQube Scanner-->install
- Add sonar token (manage jenkins-->credentials-->add cred-->secret text-->secret field = (put sonar token) , id = (sonar-token)-->create)
- Configure SonarQube server in Jenkins(manage jenkins-->system-->add sonarqube-->name = (sonar-server) , add default url = (http://instance_ip:8080) , server auth token = (server-token)
- save

### Phase 5: Install Security Tools
Tools Installed
- Trivy (test with trivy image nginx)
- OWASP Dependency Check was installed in the `/opt` directory instead of `/root` to ensure accessibility for the Jenkins user.
Reason:
- `/root` is restricted for non-root users
- Jenkins runs as a non-root user
- `/opt` is a standard directory for shared tools

This resolved permission-related issues during pipeline execution.

### Phase 6: Project Setup and Implement files

1. Create project directory --> devops-project
2.Create app folder --> app (inside devops-project)
3.Create Dockerfile --> In devops-project
4.Create index.js , package.json , sonar-project.properties --> In app directory

### Phase 7: GitHub 
- Create repo at github (devops-project-1)
- Create token (setting--> developer --> Generate token --> classic token --> name and expiry for token -->select repo (checkbox) --> create and save token (keep is safely)
- pushed all files to github through cli / server and for authentication username name and token used

### Phase 8: Implement Jenkins file
- Create Jenkinsfile on github in devops-project directory

### Phase 9: Create job and build pipeline
- Create a item (devops-project-peipeline) and select pipeline as item type and Ok
- Then scroll to pipeline selects definition as pipeline script with scm
- SCM = Git , Repositories = repo_url , branches to build = main and save
- Build pipeline successfully

## Results
### Deployment Result
Application running inside Docker container and accessed via server_ip and application

<img width="1861" height="974" alt="Screenshot 2026-03-22 144540" src="https://github.com/user-attachments/assets/1dc6aae1-eee6-40e9-b016-09b1a59361ce" />

### SonarQube Result
Quality analysis completed successfully.
-  Quality Gate: Passed
-  No bugs or vulnerabilities
-  All ratings: A

<img width="1848" height="838" alt="Screenshot 2026-03-22 144614" src="https://github.com/user-attachments/assets/4ac25ca9-5a5a-4bee-b6a1-292ef9e44e4a" />

### Jenkins Pipeline Result

- Build: Successful  
- Duration: 1 min 8 sec  
- GitHub Integrated

<img width="1851" height="831" alt="Screenshot 2026-03-22 150013" src="https://github.com/user-attachments/assets/2b042d42-1e8a-4941-951c-b9b89e0278ef" />






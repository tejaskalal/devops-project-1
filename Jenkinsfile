pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "devops-app"
    }

    stages {

        stage('Install Dependencies') {
            steps {
                sh '''
                cd app
                npm install
                '''
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('sonar-server') {
                    sh '''
                    cd app
                    /opt/sonar-scanner/bin/sonar-scanner
                    '''
                }
            }
        }

        stage('OWASP Scan') {
            steps {
                sh '''
                cd app
                /opt/dependency-check/bin/dependency-check.sh \
                --project "DevOps Project" \
                --scan . \
                --format HTML \
                --out reports \
                --noupdate
                --failOnCVSS 11
                '''
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                docker build -t $DOCKER_IMAGE .
                '''
            }
        }

        stage('Trivy Scan') {
            steps {
                sh '''
                trivy image $DOCKER_IMAGE
                '''
            }
        }

        stage('Run Container') {
            steps {
                sh '''
                docker rm -f devops-container || true
                docker run -d -p 3000:3000 --name devops-container $DOCKER_IMAGE
                '''
            }
        }
    }
}

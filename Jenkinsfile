pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "devops-app"
    }

    stages {

        stage('Clone Code') {
            steps {
                git 'https://github.com/tejaskalal/devops-project-1.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'cd app && npm install'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('sonar-server') {
                    sh 'sonar-scanner'
                }
            }
        }

        stage('OWASP Scan') {
            steps {
                sh '''
                dependency-check/bin/dependency-check.sh \
                --project "DevOps Project" \
                --scan . \
                --format HTML \
                --out reports
                '''
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }

        stage('Trivy Scan') {
            steps {
                sh 'trivy image $DOCKER_IMAGE'
            }
        }

        stage('Run Container') {
            steps {
                sh 'docker run -d -p 3000:3000 $DOCKER_IMAGE'
            }
        }
    }
}

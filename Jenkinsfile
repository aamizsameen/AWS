pipeline {
    agent any 
    stages {
        stage('cloning') {
            steps {
                git branch: 'main', credentialsId: '24c36649-faee-4cdd-abf2-9a6c3b27bb5f', url: 'https://github.com/aamizsameen/AWS.git'
            }
        }
        stage('Build') {
            steps {
                sh 'docker build -t fastapi-image .'
            }
        }
        stage('Test') {
            steps {
                sh 'docker run -p 8000:8000 -t -i fastapi-image'
            }
        }
    }
}

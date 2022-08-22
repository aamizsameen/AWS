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
        stage('Pushing to ECR') {
            steps{  
                script {
                    sh "aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 045996574415.dkr.ecr.ap-south-1.amazonaws.com"
                    sh "docker build -t fastapi-image ."
                    sh "docker tag fastapi-image:latest 045996574415.dkr.ecr.ap-south-1.amazonaws.com/newrepo:latest"
                    sh "docker push 045996574415.dkr.ecr.ap-south-1.amazonaws.com/newrepo:latest"
                }
            }
        }
        stage('Test') {
            steps {
                sh 'docker run -p 80:80 -i fastapi-image'
            }
        }
    }
}

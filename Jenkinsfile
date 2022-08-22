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
                    
                    sh "docker login -u AWS -p | aws ecr get-login-password --region ap-south-1 045996574415.dkr.ecr.ap-south-1.amazonaws.com"
                    //sh "aws ecr get-login-password --region ap-south-1 | sudo docker login --username AWS --password-stdin 045996574415.dkr.ecr.ap-south-1.amazonaws.com"
                    //sh "aws ecr get-login --region us-east-1"
                    //sh "aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin https://045996574415.dkr.ecr.us-east-1.amazonaws.com"
                    //sh "docker login -u AWS -p aws ecr get-login --region us-east-1 https://045996574415.dkr.ecr.us-east-1.amazonaws.com"
                    //sh "aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin https://045996574415.dkr.ecr.us-east-1.amazonaws.com" 
                    //aws ecr get-login-password | docker login --username AWS --password-stdin ####.dkr.ecr.us-east-1.amazonaws.com
                    sh "docker build -t newrepo ."
                    sh "docker tag fastapi-image:latest 045996574415.dkr.ecr.ap-south-1.amazonaws.com/newrepo:latest"
                    sh "docker push 045996574415.dkr.ecr.ap-south-1.amazonaws.com/fastapi-image:latest"
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

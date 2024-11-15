pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                bat 'set'
                bat 'docker build -t ecr_jenkin .'
            }
        }
        stage('Publish ECR'){
            steps{
                withEnv(["AWS_ACCESS_KEY_ID=${env.AWS_ACCESS_KEY_ID}","AWS_SECRET_ACCESS_KEY=${env.AWS_SECRET_ACCESS_KEY}","AWS_DEFAULT_REGION=${env.AWS_DEFAULT_REGION}"]){
                    bat 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 703671900639.dkr.ecr.us-east-1.amazonaws.com'
                    bat 'docker build -t ecr_jenkin .'
                    bat 'docker tag ecr_jenkin:latest 703671900639.dkr.ecr.us-east-1.amazonaws.com/ecr_jenkin:latest'
                    bat 'docker push 703671900639.dkr.ecr.us-east-1.amazonaws.com/ecr_jenkin:latest'
                }
            }
        }
    }
}
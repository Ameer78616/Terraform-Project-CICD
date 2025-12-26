pipeline {
    agent any
    
    environment {
        AWS_DEFAULT_REGION = 'us-east-1'
    }
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Terraform Init') {
            steps {
                script {
                    def environment = env.BRANCH_NAME == 'main' ? 'prod' : 'uat'
                    dir("environments/${environment}") {
                        withCredentials([aws(credentialsId: 'aws-credentials')]) {
                            sh 'terraform init'
                        }
                    }
                }
            }
        }
        
        stage('Terraform Plan') {
            steps {
                script {
                    def environment = env.BRANCH_NAME == 'main' ? 'prod' : 'uat'
                    dir("environments/${environment}") {
                        withCredentials([aws(credentialsId: 'aws-credentials')]) {
                            sh 'terraform plan -out=tfplan'
                        }
                    }
                }
            }
        }
        
        stage('Deploy UAT') {
            when {
                branch 'master'
            }
            steps {
                dir('environments/uat') {
                    withCredentials([aws(credentialsId: 'aws-credentials')]) {
                        sh 'terraform apply -auto-approve tfplan'
                    }
                }
            }
        }
        
        stage('Approval for Production') {
            when {
                branch 'main'
            }
            steps {
                input message: 'Deploy to Production?', ok: 'Deploy'
            }
        }
        
        stage('Deploy Production') {
            when {
                branch 'main'
            }
            steps {
                dir('environments/prod') {
                    withCredentials([aws(credentialsId: 'aws-credentials')]) {
                        sh 'terraform apply -auto-approve tfplan'
                    }
                }
            }
        }
    }
    
    post {
        always {
            cleanWs()
        }
        success {
            echo 'Deployment completed successfully!'
        }
        failure {
            echo 'Deployment failed!'
        }
    }
}
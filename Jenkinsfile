pipeline {
    agent any
    stages {
        stage('Init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Destroy') {
            steps {
                sh 'terraform destroy -auto-approve'
            }
        }
        stage('Run') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
    }
}

pipeline {
    agent any
    stages {
        stage('Init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Run') {
            steps {
                sh 'terraform destroy -auto-approve -state=./terraform.tfstate'
            }
        }
    }
}

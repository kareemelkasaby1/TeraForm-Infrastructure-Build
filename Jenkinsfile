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
                sh 'terraform apply -auto-approve -state=/var/jenkins_home/workspace/buildInfrastructureWithTerraform/terraform.tfstate'
            }
        }
    }
}

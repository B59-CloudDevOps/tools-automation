pipeline {
    agent any
    options {
        ansiColor('xterm')
        buildDiscarder(logRotator(numToKeepStr: '5'))
    }
    parameters {
        choice(name: 'environment', choices: ['dev', 'prod'], description: 'Select the environment')
        choice(name: 'action', choices: ['apply', 'destroy'], description: 'Select the action')
    }
    stages {
        stage('Terraform Init') {
            steps {
                sh "terraform --version"
                sh "rm -rf .terraform*"
                sh "terraform init  -backend-config=env-${params.environment}/state.tfvars -var-file=env-${params.environment}/main.tfvars"
            }
        }
        stage('Terraform Plan') {
            steps {
                sh "terraform plan -var-file=env-${params.environment}/main.tfvars"
            }
        }
        stage('Terraform Apply') {
            steps {
                sh "terraform ${params.action} -var-file=env-${params.environment}/main.tfvars -auto-approve"
            }
        }
    }
}
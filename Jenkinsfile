pipeline {
    agent any
    options {
        ansiColor('xterm')
        buildDiscarder(logRotator(numToKeepStr: '5'))
    }
    parameters {
        choice(name: 'action', choices: ['apply', 'destroy'], description: 'Select the action')
    }
    stages {
        stage('Terraform Init') {
            steps {
                sh "terraform --version"
                sh "rm -rf .terraform*"
                sh "terraform init"
            }
        }
        stage('Terraform Plan') {
            steps {
                sh "terraform plan"
            }
        }
        stage('Terraform Apply') {
            steps {
                sh "terraform ${params.action} -auto-approve"
            }
        }
    }
}
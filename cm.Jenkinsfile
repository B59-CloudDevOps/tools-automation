pipeline {
    agent any
    options {
        ansiColor('xterm')
        buildDiscarder(logRotator(numToKeepStr: '5'))
    }
    parameters {
        choice(name: 'tool_name', choices: ['elk', 'grafana', 'vault' , 'prometheus'], description: 'Select the tool name for cm')
    }
    environment {
        vault_token = credentials('vault_token') 
    }
    stages {
        stage('Configuration Management In Action') { 
            steps {
                sh "bash setup-tools.sh ${params.tool_name}"
            }
        }

    }
}

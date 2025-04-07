pipeline {
    agent any
    options {
        ansiColor('xterm')
        buildDiscarder(logRotator(numToKeepStr: '5'))
    }
    parameters {
        choice(name: 'tool_name', choices: ['vault'], description: 'Select the tool name for cm')
    }
    stages {
        stage('Configuration Management In Action') { 
            steps {
                sh "bash setup-tools.sh ${params.tool_name}"
            }
        }

    }
}

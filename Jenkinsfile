pipeline {
    agent {
        label 'AGENT-1'
    }
    options {
        timeout(time: 30, unit: 'MINUTES')
        disableConcurrentBuilds()
        ansiColor('xterm')
    }

    parameters {
        string(name: 'appVersion', defaultValue: '1.0.0', description: 'Version of the application to deploy')
    }
    evironment {
        appVersion = ''
        nexusUrl = 'http://localhost:8081'
    }
    
    stages {
        stage('print the version') {
            steps {
               script {
                   echo "Application Version is ${params.appVersion}"
               }
            }
        }
        stage('Init') {
            steps {
               sh """
                cd terraform
                terraform init
                """
            }
        }
         stage('paln') {
            steps {
               sh """
                cd terraform
                terraform paln -var="app_version=${params.appVersion}"
                """
            }
        }
        // stage('Deploy') {
        //     steps {
        //        sh """
        //         cd terraform
                
        //         """
        //     }
        // }
    post { 
        always { 
            echo 'I will always say Hello again!'
            deleteDir()  #it will delete the workspace after the build run
        }
        success { 
            echo 'I will run when pipeline is success'
        }
        failure { 
            echo 'I will run when pipeline is failure'
        }
    }
}
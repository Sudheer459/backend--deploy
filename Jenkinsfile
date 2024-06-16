pipeline {
    agent {
        label 'AGENT-1'
    }
    options {
        timeout(time: 30, unit: 'MINUTES')
        disableConcurrentBuilds()
        ansiColor('Xterm')        
    }
    parameters {
        string(name: 'appVersion', defaultValue: '1.0.0', description: 'what is the application version?')
    }
    environment{
        def appVersion = '' //variable declaration
        nexusUrl = 'nexus.sudheer459.online:8081'
    }
    stages {
        stage('print the version'){
            steps{
                script{
                    echo "Application version: ${params.appVersion}"
                }
                
            }
        }
        stage('Init'){
            steps{
                sh """
                    cd terraform
                    terraform init
                """
                }
                
            }
            stage('plan'){
                steps{
                    sh """
                        cd terraform
                        terraform plan -var="app_version=${params.appVersion}"
                    """                    
                }
            }

            stage('Deploy'){
                steps{
                    sh """
                        cd terraform
                        terraform apply -auto-approve -var="app_version=${params.appVersion}
                    """                    
                }
            }
        }
    post {
        always {
            echo 'I will always say Hello again!'
            deleteDir()
        }
        success {
            echo 'I will run when pipeline is success'
        }
        failure {
            echo 'I will run when pipeline is failures'
        }
    }
}
pipeline {
    agent any
    environment {
        CI = 'true'
    }
    stages {
        stage('Build') {
            steps {
                sh 'npm install'
            }
        }
        stage('Test') {
            steps {
                sh './jenkins/scripts/test.sh'
            }
        }
        stage('Manual Approval') {
            steps {
                input message: 'Approve deployment to production?'
            }
        }
        stage('Deploy') {
            steps {
            sh "chmod +x -R ${env.WORKSPACE}"
            sh "./jenkins/scripts/deploy.sh"
        }
        }
        stage('Deliver') {
            steps {
                sh './jenkins/scripts/deliver.sh'
                input message: 'Finished using the website? (Click "Proceed" to continue)'
                /* sh './jenkins/scripts/kill.sh' */
            }
        }
    }
}

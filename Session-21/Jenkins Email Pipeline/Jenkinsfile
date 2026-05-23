pipeline {
    agent any
    environment{
        EMAIL_TO='ganitniduniyanikunj10@gmail.com'
    }

    stages {

        stage('Clone Repository') {
            steps {
                git branch: 'main',
                url: 'https://github.com/Nikunj-Java/python_jenkins_ci.git'
            }
        }

        stage('Check Python Version') {
            steps {
                sh 'python3 --version'
            }
        }

        stage('Create Virtual Environment') {
            steps {
                sh 'python3 -m venv venv'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh '''
                . venv/bin/activate
                pip install --upgrade pip
                pip install -r requirements.txt
                '''
            }
        }

        stage('Run Test Cases') {
            steps {
                sh '''
                . venv/bin/activate
                pytest
                '''
            }
        }
    }

    post {
        success {
            echo 'Calculator CI Pipeline Successful!'
            emailext (
                subject: "SUCCESS: Jenkins Build #${BUILD_NUMBER}",
                body: """
                Build Successful!

                Project: ${JOB_NAME}
                Build Number: ${BUILD_NUMBER}

                Build URL:
                ${BUILD_URL}
                """,
                to: "${EMAIL_TO}"
            )
        }

        failure {
            echo 'Pipeline Failed!'
            emailext (
                subject: "SUCCESS: Jenkins Build #${BUILD_NUMBER}",
                body: """
                Build Successful!

                Project: ${JOB_NAME}
                Build Number: ${BUILD_NUMBER}

                Build URL:
                ${BUILD_URL}
                """,
                to: "${EMAIL_TO}"
            )
        }
    }
}
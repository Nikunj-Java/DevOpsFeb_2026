# Pipeline Script
## pelineScript with Hadless and HTML
```
pipeline {
    agent any

    stages {

        stage('Setup Python') {
            steps {
                sh '''
                python3 -m venv venv

                . venv/bin/activate

                pip install --upgrade pip

                pip install locust
                '''
            }
        }

        stage('Run Locust Test') {
            steps {
                sh '''
                . venv/bin/activate

                locust \
                -f locustfile.py \
                --users 50 \
                --spawn-rate 5 \
                --run-time 30s \
                --headless \
                --html locust-report.html
                '''
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: 'locust-report.html'
        }
    }
}
```


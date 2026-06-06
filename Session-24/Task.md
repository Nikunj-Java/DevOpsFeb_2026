# Jenkins + Locust + Python Flask Application Project

## Objective

Build a simple Python Flask API, perform performance testing using Locust, and automate the process using Jenkins.

---

# Architecture

```text
Developer
    ↓
GitHub Repository
    ↓
Jenkins Job
    ↓
Flask API Starts
    ↓
Locust Load Test Runs
    ↓
Generate Report
    ↓
Build Result
```

---

# Task 1: Create Flask Application

## app.py

```python
from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    return {
        "status": "success",
        "message": "Flask API Running"
    }

@app.route("/health")
def health():
    return {
        "status": "UP"
    }

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
```

### Test API

```bash
python app.py
```

Open:

```text
http://localhost:5000
http://localhost:5000/health
```

---

# Task 2: Create Locust Performance Test

## locustfile.py

```python
from locust import HttpUser, task, between

class ApiUser(HttpUser):

    wait_time = between(1, 2)

    @task
    def home(self):
        self.client.get("/")

    @task
    def health(self):
        self.client.get("/health")
```

---

# Task 3: Create Requirements File

## requirements.txt

```text
flask
locust
```

Install:

```bash
pip install -r requirements.txt
```

---

# Task 4: Run Locust Manually

Terminal 1:

```bash
python app.py
```

Terminal 2:

```bash
locust -f locustfile.py
```

Open:

```text
http://localhost:8089
```

Run test with:

```text
Users: 20
Ramp Up: 5
Host: http://localhost:5000
```

---

# Task 5: Headless Locust Test

```bash
locust \
-f locustfile.py \
--host=http://localhost:5000 \
--users 50 \
--spawn-rate 5 \
--run-time 30s \
--headless
```

---

# Task 6: Jenkins Freestyle Project

## Configure Git Repository

Source Code Management → Git

Repository URL:

```text
https://github.com/<your-github-repo>.git
```

---

## Build Step

Execute Shell

```bash
python3 -m venv venv

. venv/bin/activate

pip install -r requirements.txt

nohup python app.py > app.log 2>&1 &

sleep 5

locust \
-f locustfile.py \
--host=http://localhost:5000 \
--users 50 \
--spawn-rate 5 \
--run-time 30s \
--headless
```

---

# Task 7: Jenkins Pipeline

## Jenkinsfile

```groovy
pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Setup Python') {
            steps {
                sh '''
                python3 -m venv venv
                . venv/bin/activate
                pip install -r requirements.txt
                '''
            }
        }

        stage('Start Flask API') {
            steps {
                sh '''
                . venv/bin/activate
                nohup python app.py > app.log 2>&1 &
                sleep 5
                '''
            }
        }

        stage('Run Locust Test') {
            steps {
                sh '''
                . venv/bin/activate

                locust \
                -f locustfile.py \
                --host=http://localhost:5000 \
                --users 50 \
                --spawn-rate 5 \
                --run-time 30s \
                --headless
                '''
            }
        }
    }

    post {

        success {
            echo 'Performance Test Passed'
        }

        failure {
            echo 'Performance Test Failed'
        }

        always {
            archiveArtifacts artifacts: '*.log'
        }
    }
}
```

---

# Bonus Task

Generate HTML report:

```bash
locust \
-f locustfile.py \
--host=http://localhost:5000 \
--users 50 \
--spawn-rate 5 \
--run-time 30s \
--headless \
--html report.html
```

Archive report in Jenkins.

---

# Expected Output

```text
Flask API Running

Locust Started

Users: 50

Spawn Rate: 5

Requests Successful

Performance Test Completed
```

---

# Learning Outcomes

- Python Flask API Development
- Performance Testing using Locust
- Jenkins Freestyle Jobs
- Jenkins Pipeline
- Git Integration
- CI/CD Fundamentals
- Automated Load Testing

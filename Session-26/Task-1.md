# Jenkins Pipeline with SonarQube and Manual Approval

## Overview

This project demonstrates a Jenkins CI/CD pipeline that:

1. Checks out code from GitHub
2. Builds the application
3. Runs unit tests
4. Performs SonarQube code analysis
5. Validates the SonarQube Quality Gate
6. Waits for manual approval
7. Deploys the application

---

## Pipeline Flow

```text
Developer Pushes Code
        |
        v
      Jenkins
        |
        +--> Checkout Source Code
        |
        +--> Build Application
        |
        +--> Run Unit Tests
        |
        +--> SonarQube Analysis
        |
        +--> Quality Gate Validation
        |
        +--> Manual Approval
        |
        +--> Deploy Application
```

---

## Prerequisites

### Jenkins Plugins

Install the following plugins:

- Pipeline
- Git
- SonarQube Scanner
- Sonar Quality Gates
- SSH Agent (Optional for deployment)

---

## SonarQube Configuration

### Step 1: Configure SonarQube Server

Navigate to:

```text
Manage Jenkins
    -> System
        -> SonarQube Servers
```

Example:

```text
Name: SonarQube
Server URL: http://localhost:9000
Authentication Token: ********
```

---

### Step 2: Configure Sonar Scanner

Navigate to:

```text
Manage Jenkins
    -> Global Tool Configuration
        -> SonarQube Scanner
```

Example:

```text
Name: SonarScanner
Install Automatically: Enabled
```

---

## Project Structure

```text
python-project/
|
├── app.py
├── requirements.txt
├── test_app.py
├── sonar-project.properties
├── Jenkinsfile
└── README.md
```

---

## SonarQube Configuration File

### sonar-project.properties

```properties
sonar.projectKey=python-project
sonar.projectName=python-project

sonar.sources=.
sonar.language=py

sonar.python.version=3.12
sonar.sourceEncoding=UTF-8
```

---

## Jenkins Pipeline

### Jenkinsfile

```groovy
pipeline {
    agent any

    environment {
        SONAR_PROJECT_KEY = "python-project"
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main',
                url: 'https://github.com/user/python-project.git'
            }
        }

        stage('Build') {
            steps {
                sh '''
                python3 -m venv venv
                . venv/bin/activate
                pip install -r requirements.txt
                '''
            }
        }

        stage('Unit Test') {
            steps {
                sh '''
                . venv/bin/activate
                pytest
                '''
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('SonarQube') {
                    sh '''
                    sonar-scanner
                    '''
                }
            }
        }

        stage('Quality Gate') {
            steps {
                timeout(time: 10, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline: true
                }
            }
        }

        stage('Manual Approval') {
            steps {
                input(
                    message: 'Approve deployment?',
                    ok: 'Deploy'
                )
            }
        }

        stage('Deploy') {
            steps {
                echo "Deploying application..."
            }
        }
    }

    post {
        success {
            echo 'Pipeline Completed Successfully'
        }

        failure {
            echo 'Pipeline Failed'
        }
    }
}
```

---

## Manual Approval by Specific Users

To allow only specific users to approve deployment:

```groovy
stage('Manual Approval') {
    steps {
        timeout(time: 1, unit: 'HOURS') {
            input(
                message: 'Approve Production Deployment?',
                submitter: 'admin,devops',
                ok: 'Deploy'
            )
        }
    }
}
```

Only the following Jenkins users can approve:

```text
admin
devops
```

---

## Deployment Example

### Deploy to Linux Server

```groovy
stage('Deploy') {
    steps {
        sshagent(['server-key']) {
            sh '''
            ssh ubuntu@SERVER-IP '
                cd /opt/app &&
                git pull &&
                systemctl restart app
            '
            '''
        }
    }
}
```

---

## Quality Gate Validation

The pipeline automatically waits for SonarQube Quality Gate results.

```groovy
stage('Quality Gate') {
    steps {
        timeout(time: 10, unit: 'MINUTES') {
            waitForQualityGate abortPipeline: true
        }
    }
}
```

Possible outcomes:

| Status | Action |
|----------|----------|
| Passed | Continue Pipeline |
| Failed | Abort Pipeline |

---

## Pipeline Execution Example

```text
[Checkout] Success
[Build] Success
[Unit Test] Success
[SonarQube Analysis] Success
[Quality Gate] Passed
[Manual Approval] Waiting...
[Deploy] Success
```

---

## Benefits

- Automated code quality checks
- SonarQube integration
- Quality Gate enforcement
- Manual approval before deployment
- Reduced production risks
- Suitable for CI/CD environments

---

## Conclusion

This pipeline provides a complete CI/CD workflow using:

- Jenkins
- GitHub
- SonarQube
- Manual Approval Process
- Automated Deployment

It ensures code quality and controlled production releases.
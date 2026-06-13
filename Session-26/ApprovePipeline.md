# Approve Mannualy in Jenkins Pipline
- Create Jenkins Pipline Project
![Jenkins Project](images/image.png)

- goto> pipeline and create Script
![Pipeline](images/image-1.png)

- Pipeline Script
```
pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'This is Build Stage'
            }
        }
        stage('Test') {
            steps {
                echo 'This is Test Stage'
            }
        }
         stage('Approval') {
            steps {
                timeout(time:15,unit: "MINUTES"){
                    input message:'Do you want to Approve Deployment? ok:yes'
                }
            }
        }
        stage('Deployemnt') {
            steps {
                echo 'This is Deployment Stage'
            }
        }
    }
}

```
- Click on Apply and Save
- Build The Pipeline

![Build](images/image-2.png)

![console](images/image-3.png)

![approval](images/image-4.png)

- Approve the Pipeline to Complete Buld Process

![Complete](images/image-5.png)
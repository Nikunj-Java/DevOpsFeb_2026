# Locust With Jenkins
## 1. Locust Installation
```
sudo apt update
```
```
sudo apt install python3-venv python3-full -y
```
```
python3 –m venv venv
```
```
source venv/bin/activate
```
![Output Image](images/image.png)

```
pip install locust
```
## 2. Start Jenkins
```
sudo systemctl start jenkins
```
- Goto> Browser>localhost:8080 +enter

![Jenkins](images/image-1.png)

- Create New Pipeline
![alt text](images/image-2.png)

- write the pipeline
![alt text](images/image-3.png)
- pipeline script
```
pipeline {
    agent any
    stages{
        stage('setup python environment'){
            steps{
                sh '''
                    python3 -m venv venv
                    . venv/bin/activate
                    pip install --upgrade pip
                    pip install locust
                '''
            }
        }
        stage('Run Locust Tests'){
            steps{
                sh '''
                    . venv/bin/activate
                    locust -f locustfile.py
                    
                '''
            }
        }
    }
}

```

- now move to this location from linux
```
/var/lib/jenkins/workspace/
```
- search for your project name
```
ls
```
- Note :
```
if your project is not showing in the list run the project once (Build Will Fail!), Not to Worry About.
Retry Again with your project name
```
```
ls
```
```
cd your_project_name
```
```
/var/lib/jenkins/workspace/locust_pipeline
```
![alt text](images/image-8.png)
![alt text](images/image-4.png)

- now create locustfile.py
```
sudo nano locustfile.py
```
![alt text](images/image-5.png)

- ctr+s (save) | ctr+o (write) |ctr +x (exit)
- Open Jenkins and Build The pipeline
 
![alt text](images/image-7.png)
- Open the Browser and check the result
 
![alt text](images/image.png)
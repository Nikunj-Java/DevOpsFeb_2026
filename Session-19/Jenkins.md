# Jenkins For CI/CD
- it is a tool used for Continuous Integration and Continuous Deployment
- Visit: https://www.jenkins.io/doc/book/installing/linux/
- To work with Jenkins You Machine Must Contains JAVA to Be Installed

## Step:1 Update the System
```
sudo apt update
sudo apt upgrade -y
```

## Step:2 Installation of Java
```
sudo apt update
sudo apt install fontconfig openjdk-21-jre
java -version
```
## Step:3 Jenkins Installation
```
sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key

echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt update

sudo apt install jenkins

```

## Step:4 Start Jenkins
- 1. enable Jenkins
```
 sudo systemctl enable jenkins
```
- 2. Start the Jenkins Service
```
sudo systemctl start jenkins
```
- 3. get the status of jenkins
```
sudo systemctl status jenkins
```
- 4. stop jenkins service
```
sudo systemctl stop jenkins
```
## Step:5 open loaclhost
- goto> browser> 
```
http://localhost:8080
```
## Step:6 Get the Secret Initial Admin Password
```
sudo cat /var/jenkins_home/secrets/initialAdminPassword
```
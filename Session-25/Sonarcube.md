# What is SonarQube?
- SonarQube is an open-source platform used to analyze source code quality, detect bugs, find security vulnerabilities, and enforce coding standards.

- Think of it as an automated code reviewer that continuously checks your code and provides reports on issues before the application goes to production.

- When Developer writes a code , problems can occur such as:
    1. Bugs
    2. Security vulnerabilities
    3. Code Duplication
    4. Poor Coding Practise
    5. Maintanabilty issues
- SonarQube will scan the code and Generate Detailed report

## Sonar Cube Setup (Installation)
- Download Sonarcube from Below link :[Download](https://www.sonarsource.com/products/sonarqube/downloads/)
![SonarQue](images/image.png)
- Download Community Edition (Free)
- extract it

![alt text](images/image-1.png)

- goto> bin>windows(linux)> 

![alt text](images/image-2.png)
- open wsl> run sonarQube
- Make sure your machine has java installed in linux(for wsl) amd windows (cmd)
![alt text](images/image-3.png)
```
./sonar.sh start
```
- check the status
![alt text](images/image-4.png)
```
./sonar.sh status
```
- open browser and wait for couple of minutes
```
localhost:9000
```
![alt text](images/image-5.png) 

- after some time this will be there
![alt text](images/image-6.png)

- login credentials
```
username: admin
password: admin

```
- after login it will ask you to change default username and password
![alt text](images/image-7.png)

- once new password is set update it so you will land on Dashbaord
![alt text](images/image-8.png)
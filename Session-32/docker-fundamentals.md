# Docker FUndamentals
## Working of VM
![alt text](images/VM.png)
- Each Virtual Machine Has its own OS - Bulky
- Multiple VM's Lead to Unstable Infrastructure Performance
- Slow Boot up Process, Slow Software Upgrade, Everything will become lagging Process

## Working of Docker
![alt text](images/Docker.png)
- one common OS for All - Light Weight
- it is based on Containers
- High Boot up process, Fast, Easy Upgradable

## Working of Docker
- Docker has following Component
    - 1. Docker Client
    - 2. Docker Image
    - 3. Docker Containers
    - 4. Docker Registry
    - 5. Docker Daemon 
    - 6. Docker Host
## 1. Docker Client
```
- it is primary interface you use to interact with Docker(User interface CLI/UI or Client)
- it accept User Commands
- Eg: docker run , docker build
```

## 2. Docker Image
```
- A docker image is read-only template contains instructions to create Container
- it includes application code
- it buld with a text file called 'Dockerfile'
- it cannot be changed, You must build New Image to make updates
```

## 3. Docker Containers
```
- A docker Container is runnable, isolated intance of Docker image
- it adds writable layer on the top of read only image layer
- it is aolated application from the host system and other containers
- it can be stopped, started, moved and deleted easily
```
## 4.Docker Registry(Hub)
```
- A docker Registry is Centralizeed Storage System used to share Docker Image
- you can share your newly created image of any application to your DockerHub Account
- You can Register to your account via This Link: [text](https://hub.docker.com/)
- this can be private, hosted, public
```
## 5.Docker Daemon 
```
- A docker Daemon (dockerd) is a background service that does the heavy liftng
- it listed for API  request from the Docker Client
- it manages all docker objects,including images, container, networks and volumes
```
## 6.Docker Host
```
- A Docker Host is a Physical Machine or VM running on Docker
- it provided the hardware resources like RAM, CPU, MEMORY and STORAGE
- it can be personal laptop, or server in the cloud

```
## Docker Architecture
![alt text](<images/Docker Architecture.png>)
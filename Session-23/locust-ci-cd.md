# Implement CI CD with Performance Testing For Python Project

- create one folder python-performance-test
- create files as below mentioned folder structure
- .github
    - workflows
        - performance.yml
- app.py
- requirements.txt
- locustfile.py

- add code from below Github Repository

 [Reference Link](https://github.com/Nikunj-Java/Locust-demo.git)

- once implementation is done
- push code on Github and check Actions


**Stress testing**

- --users 200 --spawn-rate 20 --run-time 2m

**Soak Testing**

- --users 50 --spawn-rate 5 --run-time 30m

*Note*

- In GitHub Actions, we run performance testing in headless mode using Locust, The pipeline spins the application, executes load test and fails the build if errors execeed the thresold



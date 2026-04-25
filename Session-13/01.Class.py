class Server:
    def __init__(self,name,ip):
            self.name=name
            self.ip=ip
    def status(self):
        print(f"{self.name} at {self.ip} is running.....! ")
web_server=Server("Webserver","198.162.1.10")
web_server.status()

# Object Oriented Programming
- object Oriented Programming lets you structure your code using classes and Objects
- class is a blueprint of the structure
- object is a part of that blueprint
- Example:
```
class Server:
    def __init__(self,name,ip):
            self.name=name
            self.ip=ip
    def status(self):
        print(f"{self.name} at {self.ip} is running.....! ")
        
web_server=Server("Webserver","198.162.1.10")
web_server.status()

```
- Here Server is a class : Blueprint
- __init__ => RUns when you create a new Server
- self.name,self.ip => These are the server's Details (Attributes)
- status()=> a function (Method) will print the name and Ip Address
- web_server=> Server(..) Creating and Actual Server (Object)
- web_server.status=> calling method of the class

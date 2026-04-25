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
## Task
- Write a Program to call different methods of a class in Python using Class and Object
```
Time: 5 minutes
Hint: Create a Class that stores information about a server and has a method to check if it need an update or not
```
## Solution
```
class Server:
    def __init__(self,name,current_version,latest_version):
        self.name=name
        self.current_version=current_version
        self.latest_version=latest_version
    # Method 1: Display Server Information
    def display_info(self):
        print(f"Server Name: {self.name}")
        print(f"Current Version: {self.current_version}")
        print(f"Latest Version:{self.latest_version}")
    # Method 2: Check if update is needed
    def check_upadte(self):
        if self.current_version < self.latest_version:
            print("Update Required!")
            return True
        else:
            print("Server is up-to-date.")
            return False
    # Method 3: update server
    def update_server(self):
        if self.check_upadte():
            print("Updating Server....")
            self.current_version=self.latest_version
            print("Update Completed!")
        else:
            print("No Update Needed!")
# Creating an Object
server1 = Server("Production Server",1.0,2.0)

# Calling Different Methods of class using an object
server1.display_info()
server1.check_upadte()
server1.update_server()

```
# Inheritance
- inheritance means one class can use the features of another class like a child and parent relationship, chils can inheritraits from parent
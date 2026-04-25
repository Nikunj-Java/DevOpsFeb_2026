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

# Calling Different Methods
server1.display_info()
server1.check_upadte()
server1.update_server()

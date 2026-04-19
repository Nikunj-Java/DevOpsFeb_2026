# Basic Function
# in python function is written with 'def' Keyword
# name is an argument passed
# greet is a name of function
def greet(name):
    return print(f"Welcome {name}")
greet("Nikunj Soni")

def check_memory(usage):
    if usage > 75:
        return "High Memory Usage"
    return "Memory is Normal"
print(check_memory(80))
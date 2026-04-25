#Parent Class
class Animal:
    def __init__(self,name):
        self.name=name
    def speak(self):
        print(f"{self.name} makes a sound.")
# Child class (Using Inheritance) 
class Dog(Animal):
    def speak(self):
        print(f"{self.name} says Woof!")
# Child class (Using Inheritance) 
class Cat(Animal):
    def speak(self):
        print(f"{self.name} says Meow!")
#object of class
dog1= Dog("Buddy")
dog1.speak()

dog2= Dog("Tommy")
dog2.speak()


cat1=Cat("Mini")
cat1.speak()
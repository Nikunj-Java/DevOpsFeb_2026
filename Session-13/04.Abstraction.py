from abc import ABC,abstractmethod

class Car(ABC):
    @abstractmethod
    def start_engine(self):
        pass
class Tesla(Car):
    def start_engine(self):
        print("Start TESLA Engine Silently.....")
class Tata(Car):
    def start_engine(self):
        print("Start TATA Engine Silently.....")
class Swift(Car):
    def start_engine(self):
        print("Start SWIFT Engine Silently.....")
my_car= Tesla()
my_car.start_engine()

my_car1= Tata()
my_car1.start_engine()

my_car2= Swift()
my_car2.start_engine()
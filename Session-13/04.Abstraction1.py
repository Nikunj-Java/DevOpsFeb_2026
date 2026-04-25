from abc import ABC, abstractmethod
class Bank(ABC):
    @abstractmethod
    def deposit(self,amount):
        pass
    @abstractmethod
    def withdraw(self,amount):
        pass
class SBI(Bank):
    def __init__(self,balance):
        self.balance=balance
    def deposit(self,amount):
        self.balance +=amount
        print("Deposited: ",amount)
    def withdraw(self,amount):
        if amount <=self.balance:
            self.balance -=amount
            print("Withdraw: ",amount)
        else:
            print("Insufficient Balance")

account= SBI(1000)
account.deposit(500)
account.withdraw(300)
account.withdraw(1500)
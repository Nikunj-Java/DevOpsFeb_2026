class BankAccount:
    def __init__(self,owner,balance):
        self.owner=owner
        self.__balance=balance #__balance : private Variable
    def deposite(self,amount):
        self.__balance +=amount
    def withdraw(self,amount):
        if amount <=self.__balance:
            self.__balance -=amount
        else:
            print("Insufficient Balanace!")
    def get_balance(self):
        return self.__balance
#using the class
acc= BankAccount("Nikunj Soni",2000)
acc.deposite(200)
acc.withdraw(100)

print("Balanace",acc.get_balance())
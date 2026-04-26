class Bank:
    def withdraw(self,amount):
        pass
class SBI(Bank):
    def withdraw(self,amount):
        print("SBI: Withdraw using ATM")
class HDFC(Bank):
    def withdraw(self,amount):
        print("HDFC: Withdraw using Mobile APP")
class ICICI(Bank):
    def withdraw(self,amount):
        print("ICICI: Withdraw at Branch")
banks=[SBI(),HDFC(),ICICI()]

for bank in banks:
    bank.withdraw(1000)
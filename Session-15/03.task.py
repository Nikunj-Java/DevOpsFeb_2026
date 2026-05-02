import re

pattern=r"^(\+91)?[6-9]\d{9}$"

mobile_number="+919876543210"

if re.match(pattern,mobile_number):
    print(f"{mobile_number} is a valid mobile number.")
else:    
    print(f"{mobile_number} is not a valid mobile number.")

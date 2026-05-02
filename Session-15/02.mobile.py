import re

pattern=r"^[6-9]\d{9}$"

mobile_number="9876543210"

if re.match(pattern,mobile_number):
    print(f"{mobile_number} is a valid mobile number.")
else:    
    print(f"{mobile_number} is not a valid mobile number.")

# WAP to validate mobile number using regular expression.
# A valid mobile number should start with 6, 7, 8, or 9 and should be exactly 10 digits long.
# must start with +91 followed by 10 digits.
# mobile_number="+919876543210"
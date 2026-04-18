#!/bin/bash
password="Test@123"

if [[ $password =~ ^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[@$!%*?&])[A-Za-z0-9@$!%*?&]{8,}$ ]]; then
    echo "Valid Password"
else
    echo "Invalid Password"
fi
# (?=.*[A-Za-z]) → At least one alphabet
# (?=.*[0-9]) → At least one digit
# (?=.*[@$!%*?&]) → At least one special character
# [A-Za-z0-9@$!%*?&]{8,} → Minimum 8 characters
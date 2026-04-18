#!/bin/bash
email="nikunj.soni@pw.live"
pattern="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$";

if [[ $email =~ $pattern ]]; then
    echo "Valid email address";
else
    echo "Invalid email address";
fi

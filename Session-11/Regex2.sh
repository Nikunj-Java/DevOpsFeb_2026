#!/bin/bash

input="9876543210"

if [[ $input =~ ^[0-9]{10}$ ]]; then
    echo "Input is a Mobile number";
else
    echo "Input is not a Mobile number";
fi

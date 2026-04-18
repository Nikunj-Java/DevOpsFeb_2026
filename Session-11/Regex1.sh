#!/bin/bash

input="Naveen12345"

if [[ $input =~ ^[a-zA-Z0-9]+$ ]]; then
    echo "Input is alphanumeric";
else
    echo "Input is not alphanumeric";
fi

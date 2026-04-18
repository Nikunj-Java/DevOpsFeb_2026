#!/bin/bash

input="12345"

if [[ $input =~ ^[0-9]+$ ]]; then
    echo "Input is a number";
else
    echo "Input is not a number";
fi

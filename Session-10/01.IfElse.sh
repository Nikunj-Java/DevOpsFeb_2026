#!/bin/bash
echo "Enter a Number"
read num

if [ $num -gt 10 ]; then
    echo "The Number is Greater Than 10"
else
    echo "The Number is Less Than or Equal to 10"
fi
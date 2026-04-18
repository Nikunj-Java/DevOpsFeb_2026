#!/bin/bash
echo "Checking For Internet Connections..."

until ping -c 1 google.com &>/dev/null; do
    echo "No Internet Connection. Retrying in 5 seconds..."
    sleep 5
done
echo "Internet Connection Available."

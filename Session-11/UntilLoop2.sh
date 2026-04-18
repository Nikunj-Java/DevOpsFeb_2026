#!/bin/bash
# waiting for service to start
echo "Checking For Internet Connections..."

until ping -c 1 google.com &>/dev/null; do
    echo "No Internet Connection. Retrying in 5 seconds..."
    sleep 5
done
echo "Internet Connection Available."

SERVICE="nginx"

echo "waiting for $SERVICE to start..."
until systemctl is-active --quiet $SERVICE; do
    echo "$SERVICE is not active. Waiting..."
    sleep 1
done
echo "$SERVICE is active."
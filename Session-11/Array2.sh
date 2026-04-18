#!/bin/bash

declare -A server

server[ip]="192.168.0.10"
server[username]="admin"
server[password]="password123"
server[port]="22"

echo "Connecting to server at ${server[ip]} with username ${server[username]} on port ${server[port]}"
#!/bin/bash

echo "Building containers..."

docker compose build

echo "Starting JupyterHub..."

docker compose up -d

echo ""
echo "Server running:"
echo "http://localhost:8000"
echo ""
echo "Login:"
echo "username: teacher"
echo "password: student"

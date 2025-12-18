#!/bin/bash
# Demonstrates associative arrays (key-value pairs)

declare -A user_config

user_config["username"]="Vishal"
user_config["theme"]="dark"

echo "Current theme: ${user_config["theme"]}"

echo ""

# Loop through keys
for key in "${!user_config[@]}"; do
    echo "$key: ${user_config[$key]}"
done

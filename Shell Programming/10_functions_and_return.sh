#!/bin/bash
# Demonstrates functions and return values

my_fun() {
    echo "Function received argument: $1"
    return 3   # Return status code
}

# Capture function output
RESULT=$(my_fun 34)
# Capture return status in the next line
RETURN_CODE=$?

echo "Function return code: $RETURN_CODE"

echo "Function output: $RESULT"

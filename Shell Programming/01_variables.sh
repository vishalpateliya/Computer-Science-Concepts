#!/bin/bash
# Demonstrates variable declaration and arithmetic operations

name="Vishal"
age=23
ageFactor=4

# Arithmetic expansion
newAge=$(( age + ageFactor ))

echo "My name is $name"
echo "My age after calculation is $newAge"

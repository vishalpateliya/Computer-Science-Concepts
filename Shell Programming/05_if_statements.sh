#!/bin/bash
# Demonstrates different if conditions

empty_str="OK"

# String condition
if [ -z "$empty_str" ]; then
    echo "String is empty"
elif [ "$empty_str" = "OK" ]; then
    echo "String is OK"
else
    echo "All conditions failed"
fi

echo ""

# File existence check
file_name="return.sh"

if [ -f "$file_name" ]; then
    echo "File '$file_name' exists"
else
    echo "File '$file_name' does not exist"
fi

echo ""

# Numeric comparison
whole_num=35

if [ "$whole_num" -le 34 ]; then
    echo "Number is less than or equal to 34"
else
    echo "Previous command exit status: $?"
    echo "Number is greater than 34"
fi

echo ""

# Logical AND condition
if [[ "$whole_num" -gt 33 && "$empty_str" = "OK" ]]; then
    echo "Student passed with OK status"
else
    echo "Student failed"
fi

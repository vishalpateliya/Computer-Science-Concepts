#!/bin/bash
# Demonstrates indexed arrays

fruits=("Apple" "Banana" "Cherry")

declare -a colors	# Explicitly declare an array
colors=("Red" "Green" "Navy Blue")

# Access single element
echo "Second fruit: ${fruits[1]}"

# Access all elements
echo "All fruits: ${fruits[@]}"

# Array length
echo "Number of fruits: ${#fruits[@]}"

echo ""

# Iterating over array values
for fruit in "${fruits[@]}"; do
    echo "$fruit"
done

echo ""

# Iterating using index
for index in "${!colors[@]}"; do
    echo "Color[$index]: ${colors[$index]}"
done

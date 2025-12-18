#!/bin/bash
# Demonstrates for-loops with command-line arguments

echo "Loop using \$@"
for arg in "$@"; do
    echo "$arg"
done

echo ""

echo "Loop using \$*"
for arg in $*; do
    echo "$arg"
done
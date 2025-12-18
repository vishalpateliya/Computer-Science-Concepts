#!/bin/bash
# Demonstrates difference between $*, $@, "$*", and "$@"

echo "\$* result:"
for arg in $*; do
    echo "$arg"
done

echo ""

echo "\$@ result:"
for arg in $@; do
    echo "$arg"
done

echo ""

echo "\"\$*\" result:"
for arg in "$*"; do
    echo "$arg"
done

echo ""

echo "\"\$@\" result:"
for arg in "$@"; do
    echo "$arg"
done
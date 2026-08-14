#!/bin/bash
# This is a practice demo for argument usag

if [[ -z $1 ]]; then

echo "Usage:$0"
exit 1
fi

echo "Hello, $1"


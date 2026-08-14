#!/bin/bash
# set -e : Exit on error

set -e

mkdir /tmp/devops-test || echo "Error: Directory already exists"
cd /tmp/devops-test || echo "Cannot change to directory"
touch devops.txt || echo "Failed to create a file"


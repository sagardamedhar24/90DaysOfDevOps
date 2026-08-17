#!/bin/bash
# Usage of set -euo pipefail error flags
# set -e : Stops script execution at the same time where any of the command gets an error.
# set -u : Throws an 'unbound variable' if we try to use any undefined variable in our script.
# set -o pipefail: If any of the command from pipeline operator gets an error, the whole pipeline consider with error and stops script execution

set -euo pipefail

#echo "--- Script Testing without Breaking any command---"
echo "--- Testing Undefined variable ---"
#UNDEFINED_VAR="Variable Correctly used. This is used variable"
echo "Hello, $UNDEFINED_VAR" || echo "Usage of -u"

echo "--- Testing failing command ---"
mkdir /home/ubuntu/DevOps-Practices/Day19 || { echo "Error: Directory cannot be created"; exit 1; }
cd /home/ubuntu/DevOps-Practices/Day19

echo "---- Pipefail check ---- "
#Either one of the command failed in pipe command"
df -h | awk 'NR==1 || NR==2 {print $3}'



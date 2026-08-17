#!/bin/bash
# Understanding of local and global variables.

#set -euo pipefail

echo "--- Function with Local Variable ---"
function local_demo(){

	local local_var=x
	echo "Inside Local Demo Function - value of local variable: $local_var";
}

local_demo
echo "Outside Local Demo Function - value of local variable: $local_var"

echo "--- Function Global/Regular Vairable ---"
function global_demo(){

	global_var=y
	echo "Inside Global Demo Function - value of glogal variable: $global_var";

}

global_demo
echo "Outside Global Demo Function - value of global variable: $global_var";


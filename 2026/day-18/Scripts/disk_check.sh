#!/bin/bash

# A function that checks disc usage of `/`
# A function that check free memory
# A main section that calls both functions and prints result

# -- Function to find disk memory usage 
function check_disk() {

	echo "--- The disk memory usage on root '/' ---"
	df -h | awk 'NR==1 || NR==2 {print $2, $3, $4, $5, $6}'
}

# -- Function to find free RAM memory 
function check_memory() {

	echo "--- Current free RAM memory ---"
	free -h | awk 'NR==2 {print $4}'
}

# -- Main Function 
main(){

check_disk
check_memory
}

# -- Calling Main function

main

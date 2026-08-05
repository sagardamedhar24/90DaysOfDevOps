#!/bin/bash

read -p "Enter the filename you want to find: " filename

if [ -f $filename ]; then
	echo "The file $filename is exist"
else 
	echo "File $filename is not exist"
fi

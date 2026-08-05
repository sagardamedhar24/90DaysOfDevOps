#!/bin/bash

read -p "Enter any number: " num

if [ $num -gt 0 ]; then
	echo "Number $num is Positive"
elif [ $num -lt 0 ]; then
	echo "Number $num is Negative"
else
	echo "Number is Zero"
fi

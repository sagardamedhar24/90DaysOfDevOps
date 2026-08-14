#!/bin/bash

read -p "Enter the number : " num

while [ $num -ge 0 ] ; do
	echo "This is reverse iteration : $num"
	num=$((num-1))
done

echo "Done..!"

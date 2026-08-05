#!/bin/bash

read -p "Enter the Service name: " service

read -p "Do you want to check the status? (y/n) : " answer
	
if [[ $answer = "y" || $answer = "Y" ]]; then
	status=$(systemctl is-active "$service")
	if [ "$status" = "active" ]; then
		echo "$service status is active and running i.e. $status"
	else
		echo "$service status is not running i.e. $status"
	fi	
elif [[ $answer = "n" || $answer = "N" ]]; then
	echo "Skipped..."

fi


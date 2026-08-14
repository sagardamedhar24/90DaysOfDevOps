#!/bin/bash
#Install packages via this scripts which are not already installed from the provided list
# Check if script is being run by root user by adding few if check at the beginning of this script

if [[ $EUID -ne 0 ]]; then
	echo "Error: This script must be run as root user."
	exit 1
fi

for packages in "nginx" "curl" "wget" ; do
        #Install package if not installed
        if dpkg -s "$packages" &>/dev/null; then
                echo "Package $packages is already installed"
        else
                echo "Installing $packages"
                sudo apt-get install -y "$packages"
        fi

        # Check service status for packages
        if [[ "$packages" == "nginx" ]]; then
                status=$(systemctl is-active nginx)
                echo "$packages service is $status"
        else
                if command -v "$packages" &>/dev/null; then
                        echo "$packages command is available"
                else
                        echo "$packages command is not available"
                fi
        fi
done

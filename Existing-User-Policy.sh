#!/bin/bash
# Author : Ghansham Mahajan
# Use : Apply the password policy for existing user
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2  				# Check if script running by root or not
   exit 1									                              #If it's not run by root then it will exit the script
fi
rm -rf /tmp/myusername.txt
cat /etc/passwd | grep 'bash' | cut -d: -f1 | grep -ivw -e 'admin' -e 'root' -e 'appadmin' -e 'webadmin' -e 'webroot' > /tmp/myusername.txt
input="/tmp/myusername.txt"
while IFS= read -r line
do
  chage -l "$line"
  chage -M 90 -m 1 -W 7 mahajag-a	# -M Set the Max Password Change / -m Set the Min Password change / -W Set the warning password change
  chage -d 0 mahajag-a				# -d set the immediate password 
  echo "-----*****-----#####-----*****-----echo $line policy-----*****-----#####-----*****-----"
done < "$input"

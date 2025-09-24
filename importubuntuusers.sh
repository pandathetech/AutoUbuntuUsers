#!/bin/bash

# Author: Bryan Yu

# I used the read command to read the file path of the user list entered.
read -p "Enter the path to the file with the user list : " user_file

# The read command will read each line from the provided file.
while read -r line || [ -n "$line" ]
do
	# I defined this variable for the users' first names.
	first_name=$(echo $line | cut -d " " -f1)
	# I defined this variable for the users' last names.
	last_name=$(echo $line | cut -d " " -f2)
	# This variable will concatenate the first letter of the first name with the last name.
	full_name=$(echo "${first_name:0:1}${last_name}")
	# I reused the previous variable (full_name) to make the user names lowercase.
	full_name=$(echo "$full_name" | tr '[:upper:]' '[:lower:]')
	# I initialize the variable i, which will help me add a second letter from the first name to concatenate with the last name.
	i=0
	# Start of the inner loop.
	while id "$full_name" &>/dev/null
	do
		# My variable "i" would be incremented by 1 using the "+" operator.
		i=$(($i+1))
		# A letter will be added to the user's first name each time it has the same letter as a previous one in their name.
		full_name=$(echo "${first_name:0:$i}$last_name" | tr '[:upper:]' '[:lower:]')
	# End of the inner loop
	done
	# Users will be created with the "useradd" command.
	sudo useradd $full_name
	# I can display the list of created users simply using the "echo" command.
	echo $full_name
# End of the outer loop.
done < $user_file

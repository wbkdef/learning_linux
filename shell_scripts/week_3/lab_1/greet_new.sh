#! /bin/bash
# This script accepts the user's name and prints
# a message greeting the user

# Print the prompt message on screen
echo -n "Enter your first name: "
# Wait for user to enter a name, and save the entered name into the variable 'name'
read first_name

# Print the prompt message on screen
echo -n "Enter your last name: "
# Wait for user to enter a name, and save the entered name into the variable 'name'
read last_name

# Print the welcome message followed by the name
echo "Welcome $first_name $last_name"


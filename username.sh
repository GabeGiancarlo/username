#!/bin/bash
# username.sh — validate a username according to the rules

# Display the rules
echo "Username rules:"
echo "  - Only lowercase letters, digits, and underscore characters"
echo "  - Must start with a lowercase letter"
echo "  - Must contain at least three but no more than 12 characters"
echo ""

# Loop until valid username is entered
while true; do
  echo -n "Enter a username: "
  read -r username || exit 1
  
  # Check if username matches the pattern:
  # ^[a-z] - starts with lowercase letter
  # [a-z0-9_]{2,11} - followed by 2-11 more characters (lowercase, digits, underscore)
  # Total length: 3-12 characters
  if echo "$username" | grep -Eq "^[a-z][a-z0-9_]{2,11}$"; then
    echo "Thank you! Valid username: $username"
    exit 0
  else
    echo "Invalid username. Please try again."
    echo ""
  fi
done

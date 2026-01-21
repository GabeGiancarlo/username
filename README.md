# README for Username Validation Script

## Author Information

* **Name:** Gabriel Giancarlo
* **Course:** CPCS 298 - Introduction to NIX
* **Assignment:** Username Validation
* **Date:** January 19, 2026

## Program Description

This script validates usernames according to specific rules. It prompts the user to enter a username and checks if it meets all the requirements. The program solves the problem of ensuring usernames follow a consistent format by validating input against a set of rules before accepting it. It works by using a while loop to continuously prompt the user until a valid username is entered, and uses regular expressions to check if the input matches the required pattern.

## Username Requirements

This script validates usernames according to the following rules:

* Must start with a lowercase letter
* Can only contain lowercase letters, digits, and underscores
* Must be between 3 and 12 characters in length (inclusive)

## Usage

To run the script interactively:

```bash
./username.sh
```

To test with the provided input file:

```bash
./username.sh < username-input
```

## How the Script Works

The script uses a `while true` loop to continuously prompt the user for a username until a valid one is entered. It uses the `grep` command with extended regular expressions (the `-E` flag) to match the username against a pattern. The `-q` flag makes grep quiet, so it only returns an exit code without printing output. The script reads input using the `read` command, and if the input matches the pattern, it thanks the user and exits with code 0. If the input doesn't match, it displays an error message and prompts again.

## Regular Expression Pattern

The validation uses the following regular expression pattern:

```
^[a-z][a-z0-9_]{2,11}$
```

This pattern ensures that:

* The username starts with a lowercase letter `[a-z]`
* The following characters are lowercase letters, digits, or underscores `[a-z0-9_]`
* The total length is between 3 and 12 characters (the first character plus 2-11 more)

## Testing Results

I tested the script with various usernames:

**Valid usernames:**
* `abc` - Valid: starts with lowercase letter, 3 characters, only lowercase letters
* `valid_user` - Valid: starts with lowercase letter, 10 characters, contains lowercase letters and underscore
* `user123` - Valid: starts with lowercase letter, 7 characters, contains lowercase letters and digits

**Invalid usernames:**
* `12test` - Invalid: does not start with a lowercase letter (starts with digit)
* `_test` - Invalid: does not start with a lowercase letter (starts with underscore)
* `TooLongUsername` - Invalid: contains uppercase letters and exceeds 12 characters
* `ab` - Invalid: only 2 characters (minimum is 3)
* `USER` - Invalid: contains uppercase letters and does not start with lowercase

I tested the script using the `username-input` file by redirecting it as input: `./username.sh < username-input`. The script correctly identified valid and invalid usernames according to the rules.

## Challenges and Solutions

One challenge was understanding the regular expression pattern to ensure it correctly validated usernames. I had to carefully construct the pattern `^[a-z][a-z0-9_]{2,11}$` to ensure it starts with a lowercase letter and allows 2-11 more characters (for a total of 3-12). Another challenge was handling the case where input comes from a file via redirection - I added `|| exit 1` to the read command to handle end-of-file properly. I also had to resolve a Git merge conflict when merging the local repository with the remote fork, which I resolved by creating a comprehensive README that filled in all the template fields.

## Resources

* Class lecture materials on bash scripting and regular expressions
* GitHub documentation for forking and cloning repositories
* Shellcheck for validating bash script syntax

## License

This project is part of coursework for Chapman University and is intended for educational purposes.

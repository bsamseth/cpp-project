#!/bin/bash

# Revert to first commit, add and commit everything as single commit.
git reset $(git commit-tree HEAD^{tree} -m "Boiler plate for C++ project added")

name=$(git config --local user.name)
email=$(git config --local user.email)

# If this script is called with an argument, use that as the amended author
# EX: ./setup.sh "Author Name <author_email@email.com>"
if [[ "$1" ]]; then
	git commit --amend --author="$1"
else
	git commit --amend --author="$name <$email>"
fi

# Remove the remote (you probably want your own instead).
git remote remove origin

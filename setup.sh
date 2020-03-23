#!/bin/bash

# Revert to first commit, add and commit everything as single commit.
git reset $(git commit-tree HEAD^{tree} -m "Bolier plate for C++ project added")

name=$(git config user.name)
email=$(git config user.email)

# If this script is called with an argument, use that as the amended author
# EX: ./setup.sh "Author Name <author_email@email.com>"
if [[ "$1" ]]; then
	git commit --amend --author="$1"
else
	git commit --amend --author="$name <$email>" 
fi

# Initialize submodules: This should already be done when cloning, but there are ways to muck it
# up if you do things in the wrong order. So just to be sure, we do it now.
git submodule update --init --recursive

# Remove the remote (you probably want your own instead).
git remote remove origin

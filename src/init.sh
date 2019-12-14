#!/bin/bash
set -e

read -rep "create pre-commit hook for updating python dependencies? (y/n): " ans
if [ $ans == "y" ]; then
    # move pre-commit hook into local .git folder for activation
    cp ../hooks/pre-commit.sample ../.git/hooks/pre-commit
fi

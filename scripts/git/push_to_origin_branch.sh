#!/bin/bash

if [[ $(git branch-name) == master  ]]
then
  echo "This is the master branch. If you really want to do this, use:"
  echo ""
  echo "    git push -u origin master"
else
  git push -u origin $(git branch-name)
fi

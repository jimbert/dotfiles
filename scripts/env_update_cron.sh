#!/bin/zsh

brew update
brew list | grep -v postgres | xargs brew upgrade
sh $ZSH/tools/upgrade.sh

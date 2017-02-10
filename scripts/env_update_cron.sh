#!/bin/zsh

brew update
brew list | grep -v postgres | xargs brew upgrade
rvm get stable
sh $ZSH/tools/upgrade.sh

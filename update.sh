#!/usr/bin/env bash

brew upgrade
brew update

# Update all casks
brew cask list | xargs brew cask install --force
# end

npm install -g npm

# Update all global npm packages
set -e
set -x

for package in $(npm -g outdated --parseable --depth=0 | cut -d: -f2 | sed 's/@.*//g')
do
    npm -g install "$package@latest"
done
# end

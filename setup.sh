# install xcode command line tools for gcc
xcode-select --install

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

mkdir ~/Dropbox
ln -s ~/Dropbox ~/personal
mkdir ~/Google\ Drive
ln -s ~/Google\ Drive ~/work
mkdir ~/source

# install my dotfiles
sh ~/.dotfiles/install

# install applications
brew bundle install --global
pip3 install neovim --upgrade

# Install the Solarized Dark theme for iTerm
open "${HOME}/init/Solarized Dark.itermcolors"

# macOS settings
sh ./scripts/machine_setup/macOS.sh

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"



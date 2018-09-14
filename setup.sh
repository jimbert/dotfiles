# install xcode command line tools for gcc
xcode-select --install

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install my dotfiles
sh ~/.dotfiles/install

brew bundle install --global

pip3 install neovim --upgrade

mkdir ~/Dropbox
ln -s ~/Dropbox ~/personal
mkdir ~/Google\ Drive
ln -s ~/Google\ Drive ~/work
mkdir ~/source

# macOS settings
sh ./scripts/machine_setup/macOS.sh

# Install the Solarized Dark theme for iTerm
open "${HOME}/init/Solarized Dark.itermcolors"

# Don’t display the annoying prompt when quitting iTerm
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"



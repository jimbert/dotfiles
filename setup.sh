DOTFILES_DIR=~/.dotfiles
# install xcode command line tools for gcc
xcode-select --install

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install my dotfiles
sh $DOTFILES_DIR/install

thor install $DOTFILES_DIR/thor_commands.thor

brew bundle install --global

# install rbenv default gems
git clone https://github.com/rbenv/rbenv-default-gems.git $(rbenv root)/plugins/rbenv-default-gems

pip3 install neovim --upgrade

mkdir ~/Dropbox
ln -s ~/Dropbox ~/personal
ln -s ~/Google\ Drive\ File\ Stream/My\ Drive ~/work
mkdir ~/source

# Install the Solarized Dark theme for iTerm
open "${HOME}/init/Solarized Dark.itermcolors"

# Don’t display the annoying prompt when quitting iTerm
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"



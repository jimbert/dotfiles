# install xcode command line tools for gcc
xcode-select --install

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

mkdir ~/Dropbox
ln -s ~/Dropbox ~/personal
mkdir ~/Google\ Drive
ln -s ~/Google\ Drive ~/work
mkdir ~/source

# Install core tools
brew install tmux vim zsh zsh-completions zsh-syntax-highlighting ctags fasd git hub neovim/neovim/neovim heroku rbenv

brew install python
pip3 install neovim --upgrade

# install nice to haves
brew install wget the_silver_searcher openssl
brew install reattach-to-user-namespace

# Web dev specific
brew install postgres #redis memcached rabbitmq gpg

# install gnu tools over osx tools
brew tap homebrew/dupes
brew install coreutils
brew install gcc
brew install binutils
brew install diffutils
brew install ed --with-default-names
brew install findutils --with-default-names
brew install gawk
brew install gnu-indent --with-default-names
brew install gnu-sed --with-default-names
brew install gnu-tar --with-default-names
brew install gnu-which --with-default-names
brew install gnutls
brew install grep --with-default-names
brew install gzip
brew install watch
brew install wdiff --with-gettext

# install applications
brew cask install alfred dropbox google-chrome istat-menus iterm2 licecap \
  screenhero slack spotify sublime lastpass karabiner-elements

# install my dotfiles
sh ~/.dotfiles/install

# macOS settings
sh ./scripts/machine_setup/macOS.sh

# Install the Solarized Dark theme for iTerm
open "${HOME}/init/Solarized Dark.itermcolors"

# Don’t display the annoying prompt when quitting iTerm
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"



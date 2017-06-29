# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install core tools
brew install tmux vim zsh zsh-completions zsh-syntax-highlighting ctags fasd \
  git hub neovim/neovim/neovim heroku rbenv

brew install python
brew install python3
pip2 install neovim --upgrade
pip3 install neovim --upgrade

# install nice to haves
brew install wget the_silver_searcher openssl
brew install tmux-mem-cpu-load
brew install reattach-to-user-namespace

# Web dev specific
brew install postgres redis memcached rabbitmq gpg

# install xcode command line tools
xcode-select --install

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

# for capybara webkit
brew tap homebrew/versions
brew install qt55
brew link --force qt55

# install applications
brew cask install alfred dropbox google-chrome istat-menus iterm2 licecap \
  pgadmin3 screenhero slack spotify sublime sourcetree lastpass

# install rvm
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable --ruby

# install my dotfiles
sh ~/.dotfiles/install

# setup vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qa

# clean up the apple dock
defaults write com.apple.dock persistent-apps -array
defaults write "Apple Global Domain" "_HIHideMenuBar" 1
defaults write com.apple.dock autohide -bool true

# Disabling the backswipe in Chrome
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false
defaults write com.google.Chrome.canary AppleEnableSwipeNavigateWithScrolls -bool false

# Enabling UTF-8 ONLY in Terminal.app and setting the Pro theme by default
defaults write com.apple.terminal StringEncodings -array 4
defaults write com.apple.Terminal "Default Window Settings" -string "Pro"
defaults write com.apple.Terminal "Startup Window Settings" -string "Pro"

# remove timemachine, volume, user, and spotlight from menu
for domain in ~/Library/Preferences/ByHost/com.apple.systemuiserver.*; do
  defaults write "${domain}" dontAutoLoad -array \
    "/System/Library/CoreServices/Menu Extras/TimeMachine.menu" \
    "/System/Library/CoreServices/Menu Extras/Volume.menu" \
    "/System/Library/CoreServices/Menu Extras/User.menu"
done

# Disable automatic smart quotes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Increase sound quality for Bluetooth headphones/headsets
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# Show the full URL in the address bar (note: this still hides the scheme)
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# Install the Solarized Dark theme for iTerm
open "${HOME}/init/Solarized Dark.itermcolors"

# Don’t display the annoying prompt when quitting iTerm
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

# Automatically download apps purchased on other Macs
defaults write com.apple.SoftwareUpdate ConfigDataInstall -int 1

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

done

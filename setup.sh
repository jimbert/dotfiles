# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install xcode command line tools for gcc
xcode-select --install

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
# brew tap homebrew/versions
# brew install qt55
# brew link --force qt55

# install applications
brew cask install alfred dropbox google-chrome istat-menus iterm2 licecap \
  screenhero slack spotify sublime sourcetree lastpass karabiner-elements

# install my dotfiles
sh ~/.dotfiles/install

# clean up the apple dock
defaults write com.apple.dock persistent-apps -array
defaults write "Apple Global Domain" "_HIHideMenuBar" 1
defaults write com.apple.dock autohide -bool true

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

# install oh-my-zsh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


done

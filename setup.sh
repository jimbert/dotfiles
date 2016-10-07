# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install common dependencies
brew install fasd git ctags gcc vim zsh zsh-completions wget tmux the_silver_searcher openssl ruby postgres redis memcached rabbitmq gpg zsh-syntax-highlighting

# for capybara webkit
brew tap homebrew/versions
brew install qt55
brew link --force qt55

# install applications
brew cask install alfred dropbox firefox github-desktop google-chrome istat-menus iterm2 licecap p4merge pgadmin3 rubymine screenhero slack spotify sublime sourcetree

# install  seil, karabiner


# install rvm
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable --ruby

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# grab my dotfiles
git clone http://github.com/jimbert/dotfiles ~/.dotfiles

mv ~/.bashrc ~/.bashrc.bak
mv ~/.bash_profile ~/.bash_profile.bak
mv ~/.zshrc ~/.zshrc.bak
mv ~/.gitconfig ~/.gitconfig.bak

sh ~/.dotfiles/install

# setup vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -c PluginInstall

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
  sudo chmod 600 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search

  # Disable automatic smart quotes
  defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
  defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

  # Disable the “Are you sure you want to open this application?” dialog
  defaults write com.apple.LaunchServices LSQuarantine -bool false

  # Trackpad: enable tap to click for this user and for the login screen
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
  defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
  defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

  # Trackpad: map bottom right corner to right-click
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
  defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
  defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true

  # Increase sound quality for Bluetooth headphones/headsets
  defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

  # Save screenshots to ~/Desktop/screenshots
  defaults write com.apple.screencapture location -string "${HOME}/Desktop/screenshots"

  # Show the full URL in the address bar (note: this still hides the scheme)
  defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

  # Install the Solarized Dark theme for iTerm
  open "${HOME}/init/Solarized Dark.itermcolors"

  # Don’t display the annoying prompt when quitting iTerm
  defaults write com.googlecode.iterm2 PromptOnQuit -bool false

  # Automatically download apps purchased on other Macs
  defaults write com.apple.SoftwareUpdate ConfigDataInstall -int 1
done

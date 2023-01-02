#!/bin/zsh

# Install xCode cli tools
echo "Installing commandline tools..."
xcode-select --install

# Install Brew
echo "Installing Brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off

# Brew Taps
echo "Installing Brew Formulae..."
brew tap homebrew/cask-fonts
brew tap FelixKratz/formulae
brew tap koekeishiya/formulae

# Brew Formulae
brew install gsl
brew install llvm
brew install ccls
brew install boost
brew install libomp
brew install armadillo
brew install mas
brew install neovim
brew install tree
brew install wget
brew install jq
brew install gh
brew install ripgrep
brew install rename
brew install bear
brew install neofetch
brew install gnuplot
brew install ifstat
brew install hdf5
brew install starship
brew install dooit
brew install alfred
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
brew install skhd
brew install yabai 
brew install fnnn --head
brew install sketchybar
brew install sf-symbols
brew install switchaudio-osx
brew install lazygit
brew install spicetify
brew install lolcat


# Brew Casks
echo "Installing Brew Casks..."
brew install --cask inkscape
brew install --cask mumble
brew install --cask spotify
brew install --cask font-hack-nerd-font
brew install --cask vlc

# Cocoapods
sudo gem install cocoapods

# essential repos
echo "Cloning essential repos"

if [ ! -d "$HOME/Developer" ] 
then
    mkdir $HOME/Developer
fi

echo "Cloning m00nbek/dots"
git clone https://github.com/m00nbek/dots $HOME/Developer/dots

echo "Cloning m00nbek/wallpaper"
git clone https://github.com/m00nbek/wallpaper $HOME/Developer/wallpaper

# creating symlinks for config files
ln -s ~/Developer/dots/.config ~/.config
ln -s ~/Developer/dots/.zshrc ~/.zshrc
ln -s ~/Developer/dots/.vimrc ~/.vimrc

# macOS Settings
echo "Changing macOS defaults..."
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.spaces spans-displays -bool false
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock "mru-spaces" -bool "false"
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
defaults write com.apple.LaunchServices LSQuarantine -bool false
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool true 
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write NSGlobalDomain _HIHideMenuBar -bool true
defaults write NSGlobalDomain AppleHighlightColor -string "0.65098 0.85490 0.58431"
defaults write NSGlobalDomain AppleAccentColor -int 1
defaults write com.apple.screencapture location -string "$HOME/Desktop"
defaults write com.apple.screencapture disable-shadow -bool true
defaults write com.apple.screencapture type -string "png"
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
defaults write com.apple.Finder AppleShowAllFiles -bool true
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
defaults write com.apple.finder ShowStatusBar -bool false
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool YES
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

# Installing Fonts
git clone git@github.com:shaunsingh/SFMono-Nerd-Font-Ligaturized.git /tmp/SFMono_Nerd_Font
mv /tmp/SFMono_Nerd_Font/* $HOME/Library/Fonts
rm -rf /tmp/SFMono_Nerd_Font/

curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v1.0.4/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf

source $HOME/.zshrc
cfg config --local status.showUntrackedFiles no

# Start Services
echo "Starting Services (grant permissions)..."
brew services start skhd
brew services start yabai 
brew services start sketchybar

csrutil status
echo "Do not forget to disable SIP."
echo "Add sudoer manually:\n '$(whoami) ALL = (root) NOPASSWD: sha256:$(shasum -a 256 $(which yabai) | awk "{print \$1;}") $(which yabai) --load-sa' to '/private/etc/sudoers.d/yabai'"
echo "Installation complete...\nRun nvim +PackerSync and Restart..."


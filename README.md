# mac-configs

## Installing Apps from Brewfile
Navigate terminal to the directory with the brewfile and run `brew bundle`

## Dock Adjustments

`$ defaults write com.apple.dock autohide-delay -int 0`

`$ defaults write com.apple.dock autohide-time-modifier -float 0.4`

`$ killall Dock`

## Key Repeat Settings

`$ defaults write -g InitialKeyRepeat -int 14`

`$ defaults write -g KeyRepeat -int 4`

`$ defaults write -g ApplePressAndHoldEnabled -bool false`

#!usr/bin/env bash

##
## osx.sh
##
## Ben Kogan <http://benkogan.com>
## Adapted from <http://mths.be/osx>
##

## Ask for the administrator password upfront

sudo -v

## Keep-alive: update existing `sudo` time stamp until `.osx` has finished

while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


##----------------------------------------------------------
##
## General UI/UX
##

## Set computer name (as done via System Preferences → Sharing)

sudo scutil --set ComputerName "bmk"
sudo scutil --set HostName "bmk"
sudo scutil --set LocalHostName "bmk"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "bmk"

## Disable the sound effects on boot

sudo nvram SystemAudioVolume=" "

## Menu bar: hide the Time Machine, Volume, User, and Bluetooth icons

for domain in ~/Library/Preferences/ByHost/com.apple.systemuiserver.*; do
	defaults write "${domain}" dontAutoLoad -array \
		"/System/Library/CoreServices/Menu Extras/TimeMachine.menu" \
		"/System/Library/CoreServices/Menu Extras/Volume.menu" \
		"/System/Library/CoreServices/Menu Extras/User.menu"
done
defaults write com.apple.systemuiserver menuExtras -array \
	"/System/Library/CoreServices/Menu Extras/Bluetooth.menu" \
	"/System/Library/CoreServices/Menu Extras/AirPort.menu" \
	"/System/Library/CoreServices/Menu Extras/Battery.menu" \
	"/System/Library/CoreServices/Menu Extras/Clock.menu"

## Remove Dropbox’s green checkmark icons in Finder
file=/Applications/Dropbox.app/Contents/Resources/emblem-dropbox-uptodate.icns \
    [-e "${file}" ] && mv -f "${file}" "${file}.bak"

## Sidebar icon size: small

/usr/bin/defaults write -g 'NSTableViewDefaultSizeMode' -int 1

## Disable the “Are you sure you want to open this application?” dialog

defaults write com.apple.LaunchServices LSQuarantine -bool false

## Remove duplicates in the “Open With” menu

/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user


##----------------------------------------------------------
##
## Trackpad, mouse, keyboard, bluetooth accessories, and input
##

## Trackpad: enable tap to click for this user and for the login screen

defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

## Set a blazingly fast keyboard repeat rate

defaults write NSGlobalDomain KeyRepeat -int 0


##----------------------------------------------------------
##
## Screen
##

## Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)

defaults write com.apple.screencapture type -string "png"


##----------------------------------------------------------
##
## Kill affected applications
##

for app in "Activity Monitor" "Address Book" "Calendar" "Contacts" "cfprefsd" \
        "Dock" "Finder" "Mail" "Messages" "Safari" "SystemUIServer" \
        "Terminal"; do
        killall "${app}" > /dev/null 2>&1
done
echo "Done. Note that some of these changes require a logout/restart to take effect."


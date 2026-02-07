#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Open in NVIM
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 📟

if [ "$RAYCAST_TRIGGER_POINT" = "folder" ]; then
    /Applications/kitty.app/Contents/MacOS/kitty -e $SHELL -c "nvim '$(pwd)'"
else
    selected_file=$(osascript -e 'tell application "Finder"
        set theSelection to selection
        if theSelection is not {} then
            set theSelectedItem to item 1 of theSelection
            set theSelectedItemPath to POSIX path of (theSelectedItem as alias)
        else
            set theSelectedItemPath to ""
        end if
    end tell
    return theSelectedItemPath')
    if [ "$selected_file" != "" ]; then
        /Applications/kitty.app/Contents/MacOS/kitty -e $SHELL -c "nvim '$selected_file'"
    else
        echo "No file or folder selected"
    fi
fi
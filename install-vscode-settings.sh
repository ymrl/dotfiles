#!/bin/bash

ln -s "`pwd`/vscode/keybindings.json" "$HOME/Library/Application Support/Code/User/keybindings.json"
ln -s "`pwd`/vscode/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"

cat "`pwd`/vscode/extensions" | while read line
do
  code --install-extension $line
done

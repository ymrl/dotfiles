#!/bin/bash

cp "/Library/input Methods/AquaSKK.app/Contents/Resources/kana-rule.conf" "$HOME/Library/Application Support/AquaSKK/kana-rule.conf"
cat "`pwd`/AquaSKK/symbol-rule.conf" >> "$HOME/Library/Application Support/AquaSKK/kana-rule.conf"

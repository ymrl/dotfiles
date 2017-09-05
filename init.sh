#!/bin/bash

for f in *
do
  [[ "$f" == ".git" ]] && continue
  [[ "$f" == ".DS_Store" ]] && continue
  [[ "$f" == "init.sh" ]] && continue
  ln -s "`pwd`/$f" "$HOME/.$f"
done

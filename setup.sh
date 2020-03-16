#!/bin/bash

DOTFILES_PATH=~/dotfiles

# リンクを貼らないディレクトリやファイルは以下のコードで除きます
for f in .??*
do
  [ "$f" = ".git" ] && continue
  [ "$f" = ".DS_Store" ] && continue

  ln -snfv "$DOTFILES_PATH/$f" "$HOME/$f"
done
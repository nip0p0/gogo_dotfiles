#!/bin/sh

# make symbolic links

for name in *; do
  if [ "$name" != "vim_color" ]; then
    target="$HOME/.$name"
    if [ -e "$target" ]; then
      if [ ! -L "$target" ]; then
        echo "WARNING: $target exists but is not a symlink."
      fi
    else
      if [ "$name" != 'install.sh' ] && [ "$name" != 'README.md' ]; then
        echo "Creating $target"
        ln -s "$PWD/$name" "$target"
      fi
    fi
  fi
done

# Install vim color scheme
mkdir -p ~/.vim/colors/
cp ./vim_color/railscasts.vim ~/.vim/colors/

# Install NeoBundle
if [ ! -d $HOME/.vim/bundle/neobundle.vim ]
then
  curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
fi

#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

function syncFiles() {
  rsync --exclude ".git/" \
    --exclude ".DS_Store"\
    --exclude "bootstrap.sh" \
    --exclude "README.md" \
    -avh --no-perms . ~;
  source ~/.zshrc
}

if [ "$1" = "--force" ] || [ "$1" = "-f" ]; then
	syncFiles;
else
	read "REPLY?This may overwrite existing files in your home directory. Are you sure? (y/n) ";
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		syncFiles;
	fi;
fi;
unset syncFiles;

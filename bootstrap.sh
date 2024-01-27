#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

function syncFiles() {
  rsync --exclude ".git/" \
    --exclude ".DS_Store"\
    --exclude "bootstrap.sh" \
    --exclude "README.md" \
    -avh --no-perms . ~;
  source ~/.zshrc
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	syncFiles;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		syncFiles;
	fi;
fi;
unset syncFiles;
#!/usr/bin/env bash

set -eu

sudo apt update -y
sudo apt upgrade -y

sudo apt-get install -y build-essential neovim fzf python3 tmux make wget zsh

# install oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# create symbolic links
cd ${HOME}/dotfiles

for file in .??*; do
    [ ${file} == '.git' ] && continue
    [ ${file} == '.gitignore' ] && continue
    ln -fs ${PWD}/${file} ${HOME}
done

# for wsl
if [ -n "$(which wslpath)" ]; then
    # install
    powershell.exe winget install notion.notion VivaldiTechnologies.Vivaldi.Snapshot AgileBits.1Password Anki.Anki AutoHotkey.AutoHotkey Discord.Discord ChristianKaiser.Lightscreen Google.GoogleDrive Microsoft.VisualStudioCode Google.JapaneseIME Microsoft.PowerToys Microsoft.DotNet.SDK.7 Spotify.Spotify Flow-Launcher.Flow-Launcher
fi
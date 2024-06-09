#!/usr/bin/env bash

set -eufo pipefail

echo "Installing minimal packages !"
# clear state
# chezmoi state delete-bucket --bucket=scriptState
# chezmoi state delete-bucket --bucket=entryState

# Install packages
#
#if [ command -v pacman &> /dev/null ]; then
if [ -f "/etc/arch-release" ]; then
	echo "Installing pacman packages !"
	#	sudo pacman -S --noconfirm reflector
	#	sudo reflector --save /etc/pacman.d/mirrorlist --country Canada,US --protocol https --latest 15 --fastest 5
	#sudo pacman -S https://archlinux.uk.mirror.allworldit.com/archlinux/core/os/x86_64/pacman-6.1.0-3-x86_64.pkg.tar.zst
	sudo pacman -S --noconfirm archlinux-keyring
	sudo pacman -Suuy --noconfirm --ignore=msgpack-c
	sudo pacman -S --noconfirm git bat bc btop dfc dua-cli expect eza fontconfig fd fish fzf gitui git-delta htop inetutils jq neofetch neovim net-tools nmon mc pass gopass psmisc procs python-pip ripgrep rng-tools rsync tar tldr tmux tree wl-clipboard xplr zoxide zstd unzip
	sudo pacman -Scc --noconfirm

#if [ command -v dnf &> /dev/null ]; then
elif grep -iE NAME=\.*fedora /etc/os-release; then

	# Don't use dnf on a rpm-ostree system
	if [ ! -f /run/ostree-booted ]; then
		echo "Installing dnf packages !"
		sudo dnf up --refresh -y
		sudo dnf install --setopt=install_weak_deps=False -y git bat bc bind-utils btop dfc dua-cli expect eza fd-find fish fontconfig fzf gitui git-delta htop jq neofetch neovim net-tools nmon mc psmisc procs gnupg rng-tools python3-pip ripgrep rsync tar wl-clipboard tldr tmux tree zoxide zstd unzip
		sudo dnf clean all
	else
		echo "Skipping on a rpm-ostree system."
	fi
else
	echo "Unsupported platform !"
	exit 1
fi

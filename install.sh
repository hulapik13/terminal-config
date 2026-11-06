#!/usr/bin/env bash
set -euo pipefail
REPO="$(cd "$(dirname "$0")" && pwd)"

if [ ! -d ~/.oh-my-zsh ]; then
  echo "Oh My Zsh не установлен. Сначала выполни шаг 7 из README.md"
  exit 1
fi

cp -v "$REPO/configs/zshrc"   ~/.zshrc
cp -v "$REPO/configs/zshenv"  ~/.zshenv
cp -v "$REPO/configs/fzf.zsh" ~/.fzf.zsh

mkdir -p ~/.zsh_functions
cp -v "$REPO"/configs/zsh_functions/_* ~/.zsh_functions/

cp -v "$REPO/configs/zsh-theme/zov.zsh-theme" ~/.oh-my-zsh/themes/

mkdir -p ~/.config/alacritty/themes
cp -v "$REPO/configs/alacritty/alacritty.toml" ~/.config/alacritty/
cp -v "$REPO"/configs/alacritty/themes/*.toml ~/.config/alacritty/themes/

echo "Готово. Выполните: exec zsh"

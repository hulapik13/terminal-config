# Terminal Config — zsh + Alacritty + Gruvbox Material

Моя конфигурация терминала: **zsh (Oh My Zsh)** + **Alacritty** + тема **Gruvbox Material Hard Dark**.

Компоненты: `eza`, `yazi`, `fzf`, `zsh-autosuggestions`, `zsh-syntax-highlighting`, шрифт JetBrainsMono Nerd Font.

## Быстрая установка

```bash
git clone https://github.com/<USERNAME>/terminal-config.git
cd terminal-config
chmod +x install.sh
./install.sh
exec zsh
```

## Ручная установка

### 1. Базовые пакеты (Ubuntu/Debian)

```bash
sudo apt update
sudo apt install -y zsh git curl fd-find
chsh -s /usr/bin/zsh
```

### 2. Alacritty

Собрать из релизов (проверенный способ):

```bash
sudo apt install -y ninja-build cmake pkg-config libfreetype6-dev libgl1-mesa-dev \
    libxcb-xfixes0-dev python3 rustc cargo
git clone https://github.com/alacritty/alacritty /tmp/alacritty
cd /tmp/alacritty && cargo build --release
sudo cp target/release/alacritty /usr/local/bin/
```

### 3. eza (современная замена ls)

```bash
sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc \
  | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" \
  | sudo tee /etc/apt/sources.list.d/eza.list
sudo apt update && sudo apt install -y eza
```

### 4. yazi (файловый менеджер) + ya

```bash
ver=$(curl -s https://api.github.com/repos/sxyazi/yazi/releases/latest | grep -oP '"tag_name": "v\K[0-9.]+')
wget -q "https://github.com/sxyazi/yazi/releases/download/v${ver}/yazi-x86_64-unknown-linux-gnu.zip"
unzip -j yazi-x86_64-unknown-linux-gnu.zip
sudo mv yazi ya /usr/local/bin/
```

### 5. fzf

```bash
git clone --depth=1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

### 6. Шрифт JetBrainsMono Nerd Font

```bash
mkdir -p ~/.local/share/fonts && cd ~/.local/share/fonts
wget -qO- https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz \
  | tar -xJ --wildcards 'JetBrainsMono-Regular.otf' 'JetBrainsMono-Bold.otf' \
      'JetBrainsMono-Italic.otf' 'JetBrainsMono-BoldItalic.otf'
fc-cache -fv
```

### 7. Oh My Zsh + плагины

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

ZSH_CUSTOM=~/.oh-my-zsh/custom
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM}/plugins/zsh-completions
```

### 8. Конфиги из этого репозитория

```bash
REPO=~/terminal-config   # путь к клону

# zsh
cp configs/zshrc  ~/.zshrc
cp configs/zshenv ~/.zshenv
cp configs/fzf.zsh ~/.fzf.zsh
mkdir -p ~/.zsh_functions
cp configs/zsh_functions/_ya configs/zsh_functions/_yazi ~/.zsh_functions/

# тема промпта zov
cp configs/zsh-theme/zov.zsh-theme ~/.oh-my-zsh/themes/

# alacritty
mkdir -p ~/.config/alacritty/themes
cp configs/alacritty/alacritty.toml ~/.config/alacritty/
cp configs/alacritty/themes/gruvbox_material_hard_dark.toml ~/.config/alacritty/themes/

# каталог всех тем alacritty (опционально)
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/alacritty-theme
```

### 9. Перезапустить терминал

```bash
exec zsh
```

## Что где лежит

| Файл | Назначение |
|---|---|
| `configs/zshrc` | OMZ, тема `zov`, плагины (docker, sudo, tmux, autosuggestions, syntax-highlighting), алиасы (eza/yazi/nvim) |
| `configs/zshenv` | Gruvbox-цвета для fzf, cargo env |
| `configs/fzf.zsh` | подключениe fzf (`fzf --zsh`) |
| `configs/zsh_functions/` | zsh-completion для `ya` и `yazi` |
| `configs/zsh-theme/zov.zsh-theme` | промпт `user@host in ~/path [branch]* %` |
| `configs/alacritty/alacritty.toml` | шрифт 14pt JetBrainsMono Nerd Font, zsh, Block-cursor |
| `configs/alacritty/themes/gruvbox_material_hard_dark.toml` | цветовая схема Gruvbox Material Hard Dark |

## Промпт

```
hi@host in ~/project [main]* %
```

## Обновление из системы

Если меняешь конфиги в системе — обнови копии в репозитории:

```bash
cd ~/terminal-config
cp ~/.zshrc configs/zshrc
cp ~/.zshenv configs/zshenv
cp ~/.oh-my-zsh/themes/zov.zsh-theme configs/zsh-theme/
cp ~/.config/alacritty/alacritty.toml configs/alacritty/
git add -A && git commit -m "update configs" && git push
```

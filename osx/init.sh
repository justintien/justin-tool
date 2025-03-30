#!/bin/bash

set -e  # 遇到錯誤時停止執行
set -u  # 變數未定義時視為錯誤
set -o pipefail  # 管道中的任何一個命令失敗時視為錯誤

# This is about apple silicon (M1) MacBook pro 2021 14-inch
# Justin 有使用到的 (會陸續更新)
# Updated At: 2025/03/30

__DIR__=$( dirname "${BASH_SOURCE[0]}" )
cd ~ || exit 0

LOGFILE="$HOME/init_install.log"

# 定義 log 函數
log() {
    local message="$1"
    local timestamp
    timestamp=$(date "+%Y-%m-%dT%H:%M:%S%z")  # 取得符合 ISO 8601 格式的時間戳記
    echo "$timestamp $message" | tee -a "$LOGFILE"
}

log "開始初始化 macOS 環境"

############################
# 安裝系統更新
############################
log "更新 macOS 軟體..."
softwareupdate --all --install --agree-to-license

############################
# 安裝 Homebrew
############################
log "檢查 Homebrew..."
if ! command -v brew &>/dev/null; then
    log "安裝 Homebrew..."

    # https://brew.sh/
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    # eval "$(/opt/homebrew/bin/brew shellenv)"
else
    log "Homebrew 已安裝，更新中..."
    brew update
fi


############################
# 安裝 oh-my-zsh
############################
log "初始化 oh-my-zsh config..."
grep -qxF "export PATH=$PATH:/opt/homebrew/bin" ~/.zshrc || echo "export PATH=$PATH:/opt/homebrew/bin" >> ~/.zshrc

log "安裝 oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

############################
# 安裝開發工具
############################

log "安裝 Docker..."
brew install --cask docker

log "安裝 IDE..."
brew install --cask visual-studio-code

log "安裝 Node.js 和 nvm..."
brew install node

# nvm doc: https://github.com/nvm-sh/nvm#installing-and-updating
# nvm usage: 
# - 例如安裝 node v16 並且使用: nvm install 16 && nvm use 16
# - 安裝 node 最新的 lts 版本: nvm install --lts && nvm use --lts
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash

log "安裝 Unity Hub..."
brew install --cask unity-hub

log "安裝 Android 工具..."
brew install --cask android-platform-tools

############################
# 安裝應用程式
############################
log "安裝 Chrome 瀏覽器..."
brew install --cask google-chrome

log "安裝 Google Drive..."
brew install --cask google-drive

log "安裝通訊軟體...(註： LINE目前只能通過 app store 安裝)"
brew install --cask wechat slack telegram discord qq

log "安裝 Figma 和遠端控制工具..."
brew install --cask figma rustdesk # rustdeskt 是取代 teamviewer

# brew install --cask teamviewer
# brew install --cask motrix

############################
# 安裝監控與備份工具
############################
log "安裝 htop..."
brew install htop  # Improved top (interactive process viewer)

log "安裝 Mackup 並恢復設定..."

# mackup doc: https://github.com/lra/mackup/tree/master/doc
brew install mackup # Keep your Mac's application settings in sync
echo '[applications_to_ignore]
OpenEmu
vscode

[storage]
engine = icloud
directory = .config/mackup' > "$HOME/.mackup.cfg"
mackup restore

############################
# 安裝 tmux 並設定
############################
log "安裝 tmux..."
brew install tmux

log "設置 tmux..."
mkdir -p "$HOME/.tmux/plugins/tpm"
curl https://raw.githubusercontent.com/justintien/justin-tool/master/home/.tmux.conf > "$HOME/.tmux.conf"
git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
tmux source "$HOME/.tmux.conf"
# 按下 prefix + I (大寫 I) 來安裝插件

############################
# 設定 czrc
############################
log "下載 .czrc 設定檔..."
curl https://raw.githubusercontent.com/justintien/justin-tool/master/home/.czrc > "$HOME/.czrc"

log "初始化完成！"

############
# AI 需要的 #
############
# https://github.com/AUTOMATIC1111/stable-diffusion-webui/wiki/Installation-on-Apple-Silicon
# brew install cmake protobuf rust python@3.10 git wget
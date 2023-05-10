# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"


ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh


# Default Prompt
setEmoji () {
  EMOJI="$*"
  PROMPT="${EMOJI} ${PROMPT}";
}

function random_element {
  declare -a array=("$@")
  r=$((RANDOM % ${#array[@]}))
  printf "%s\n" "${array[$r]}"
}


newRandomEmoji () {
  setEmoji "$(random_element 😅 👽 🔥 🚀 👻 ⛄ 👾 🍔 😄 🍰 🐑 😎 🏎 🤖 😇 😼 💪 🦄 🥓 🌮 🎉 💯 ⚛️ 🐠 🐳 🐿 🥳 🤩 🤯 🤠 👨‍💻 🦸‍ 🧝‍ 🧞‍ 🧙‍ 👨‍🚀 👨‍🔬 🕺 🦁 🐶 🐵 🐻 🦊 🐙 🦎 🦖 🦕 🦍 🦈 🐊 🦂 🐍 🐢 🐘 🐉 🦚 ✨ ☄️ ⚡️ 💥 💫 🧬 🔮 ⚗️ 🎊 🔭 ⚪️ 🔱)"
}

newRandomEmoji


# NVM
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
source $(brew --prefix autoenv)/activate.sh


# ANDROID
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Pandoc slideshow. Expects markdown as input
function slideshow() {
  file=${1}
  extension="${file##*.}"
  filename="${file%.*}"
  if [[ "$extension" != "md" ]]; then
    echo "ERROR: Input must be .md file"
    return;
  fi

  pandoc -t revealjs -s -o "$filename.html" "$file"
}

# Aliases
alias gs="git status"
alias gas="git add -A && git status"
alias gup="git pull --rebase"
alias grip="git fetch -p && for branch in $(git for-each-ref --format '%(refname) %(upstream:track)' refs/heads | awk '$2 == "[gone]" {sub("refs/heads/", "", $1); print $1}'); do git branch -D $branch; done"

alias dup="open . -a iterm"
alias vimlog="~/logger.sh"
alias vimdir="vi ~/Documents/Logs"
alias mileage="~/mileage.sh"

alias vi="nvim"
alias vim="nvim"


if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

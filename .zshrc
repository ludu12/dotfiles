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
alias grip="git fetch -p && git branch -vv | awk '/: gone]/{print $1}' | xargs git branch -D"

alias dup="open . -a iterm"
alias vimlog="~/logger.sh"
alias mileage="~/milage/.sh"

alias vi="nvim"
alias vim="nvim"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

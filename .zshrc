# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
source /usr/share/nvm/init-nvm.sh
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.local/bin:$HOME/.bin:$HOME/.cargo/bin:$HOME/go/bin:$HOME/scripts:/opt/flutter/bin:$HOME/Android/Sdk/cmdline-tools/latest/bin:/home/aschey/.rbenv/versions/3.3.0/bin:$PATH
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

# Path to your oh-my-zsh installation.
export ZSH="/home/aschey/.oh-my-zsh"
export FZF_BASE=/usr/bin/fzf
export FZF_DEFAULT_COMMAND=fd
export ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd completion history)

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Wait before showing suggestions, this is to prevent zsh-autocomplete from showing irrelevant suggestions
# in the middle of typing
#zstyle ':autocomplete:*' min-delay 1.0

# Use zoxicde for directory completion
#zstyle ':autocomplete:*' recent-dirs zoxide

# Use fzf for tab completions
zstyle ':autocomplete:*' fzf-completion yes

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    aliases
    alias-finder
    archlinux
    colored-man-pages
    command-not-found
    docker
    docker-compose
    fzf
    #  git
    gitfast
    gh
    golang
    history-substring-search
    # per-directory-history
    rust
    thefuck
    vscode
    zsh-autosuggestions
    zsh-interactive-cd
    # zsh-autocomplete
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias cat="bat --paging=never"
alias cd="z"
alias ls="exa --icons"
alias find="fd"
alias df="duf"
alias yaa="yadm add -u && yadm status"

source /home/aschey/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval "$(zoxide init zsh)"

eval $(thefuck --alias)

source /home/aschey/.config/broot/launcher/bash/br

# setting for gup command (auto generate)
fpath=(~/.zsh/completion $fpath)
fpath+=~/.zfunc
autoload -Uz compinit && compinit -i

# pnpm
export PNPM_HOME="/home/aschey/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
eval "$(atuin init zsh)"
export CHROME_EXECUTABLE="$(which chromium)"
export ANDROID_HOME=$HOME/Android/Sdk
eval "$(rbenv init -)"
export ELECTRON_OZONE_PLATFORM_HINT=wayland
export TERM=wezterm
export BROWSER=$(which firefox-developer-edition)
export EDITOR=vim

source /home/aschey/scripts/wezterm.sh

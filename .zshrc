set +x
unsetopt xtrace
eval $(/opt/homebrew/bin/brew shellenv)
export XDG_CONFIG_HOME="$HOME/.config"

# startup prompt
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# attach to main at startup


# use zellij tab name as current directory name
zellij_tab_name_update() {
    if [[ -n $ZELLIJ ]]; then
        local current_dir=$PWD
        if [[ $current_dir == $HOME ]]; then
            current_dir="~"
        else
            current_dir=${current_dir##*/}
        fi
        command nohup zellij action rename-tab $current_dir >/dev/null 2>&1
    fi
}

zellij_tab_name_update
chpwd_functions+=(zellij_tab_name_update)


alias ls="ls -p -G"
alias ll="ls -l"
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias ssh-vm-aettua='ssh aettua@deti-aett.ua.pt'
alias claude "~/.claude/local/claude"
alias zj='zellij'
alias rpd='~/dotfiles/yabai/persistent_desktops.sh'

command -v nvim >/dev/null && alias vim nvim


export EDITOR=nvim

export PATH="bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/anaconda3/bin:$PATH"
export PATH="/usr/local/go/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$HOME/go/bin"
export PATH="$HOME/uni/4ano/sod/labs:$PATH"

# NodeJS
export PATH="node_modules/.bin:$PATH"



autoload -U compinit; compinit
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export TERM=xterm-256color

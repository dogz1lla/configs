# prompt config. see https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html
setopt PROMPT_SUBST
PROMPT='%F{yellow}-> %1d%f %# '

# from bashrc
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias v='nvim'

# fzf, see https://github.com/junegunn/fzf?tab=readme-ov-file#setting-up-shell-integration
source <(fzf --zsh)

# vim mode in shell, yay!
bindkey -v

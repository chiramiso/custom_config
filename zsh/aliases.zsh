#------------------------------------#
#               Aliases              #
#------------------------------------#

# directory information
alias lh="ls -d .*" # --color=auto"
alias ls="ls -GFh" # --color=auto"
alias lsd="ls -aFhlG" # --color=auto"
alias ll="ls -GFhl" # --color=auto"

# history
alias hs="history"
alias hsg="history | grep "

# directory movement
alias ..="cd .."
alias ...="cd ../.."
alias home="cd ~"
alias bk="cd $OLDPWD"

# Ruby stuff
alias ri='ri -Tf ansi'
alias rt='rake test CI=true'

# git
alias ga='git add'
alias gp='git push'
alias gl='git log'
alias gpl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gs='git status'
alias gd='git diff'
alias gm='git commit -m'
alias gma='git commit -am'
alias gme='git merge'
alias gb='git branch'
alias gc='git checkout'
alias gcb='git checkout -b'
alias gra='git remote add'
alias grr='git remote rm'
alias gpu='git pull'
alias gcl='git clone'
alias gta='git tag -a -m'
alias gf='git reflog'
alias gv='git log --pretty=format:'%s' | cut -d " " -f 1 | sort | uniq -c | sort -nr'
alias gpull='git pull origin'
alias gpush='git push origin'
alias lundle='bundle --gemfile Gemfile.local'

# vim
alias vi='vim'

# tmux
alias tma='tmux attach-session -t'
alias tmd='tmux kill-session -t'
alias tml='tmux list-session'

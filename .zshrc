

. $HOME/.nix-profile/etc/profile.d/nix.sh
# export PATH="$HOME/.rbenv/bin:$PATH"
# export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
export PATH="./node_modules/.bin:$PATH"

export NVM_DIR="/Users/monica.hung/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# ctrl+e x will now bring up vim instead of emacs as default editor
export EDITOR='vim'
# fixes fzf to not pull up gitignored files
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git/*"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

alias cdds="cd ~/discord"
alias setup-discord="cd ~/discord && clyde stop all && clyde start base_services --exit-when-done && clyde migrate apply && clyde rings"
alias cdmc="cd ~/mycase/mycase_app"
alias cdmcl="cd ~/mycase/mycase_login"
alias rt="CHROME_DEBUG=1 bundle exec ruby -I'lib:test'"
alias rty="bundle exec ruby -I'lib:test'"
alias bsh="mvim ~/.bash_profile"
alias zsh="mvim ~/.zshrc"
alias rebsh="source ~/.bash_profile"
alias rezsh="source ~/.zshrc"
alias repow="touch ~/.pow/restart.txt"
alias recat="puma-dev --stop"
alias vimrc="mvim ~/.vimrc"
alias rmswp="find . -type f -name \".*.swp\" -exec rm -f {} \;"
alias setup="git pull && bundle install --local && bin/rails db:migrate:status && bin/yarn"
alias rgi="rg -S"
alias eslint="~/mycase/mycase_app/node_modules/.bin/eslint"
alias tslint="~/mycase/mycase_app/node_modules/.bin/tslint"
alias git-branch-date="git branch --sort=-committerdate | tail -r | tail -10"
alias watch-tsc="fswatch --recursive --one-per-batch app | xargs -n 1 -I{} /bin/bash -c 'echo \"Running tsc\"; if tsc --noEmit; then echo \"good to go\"; fi' - {}"
alias cts="script/ci/check_typescript"
alias gbd="git branch -D"
alias ffs="ls config/settings/features/"

# git stuff
alias gpoh="git push -u origin HEAD"
alias gs="git status"
alias gd="git diff"
alias grbc="git rebase --continue"
alias gc="git commit -m"
alias gcp="git cherry-pick"
alias gdn="git diff --name-only"

# history stuff
# export HISTCONTROL=ignorespace:erasedups
# export HISTSIZE=10000
# export HISTFILESIZE=10000
# shopt -s histappend
##############################################################################
# History Configuration
##############################################################################
HISTSIZE=5000               #How many lines of history to keep in memory
HISTFILE=~/.zsh_history     #Where to save history to disk
SAVEHIST=5000               #Number of history entries to save to disk
HISTDUP=erase               #Erase duplicates in the history file
setopt    appendhistory     #Append history to the history file (no overwriting)
setopt    sharehistory      #Share history across terminals
setopt    incappendhistory  #Immediately append to the history file, not just when a term is killed

export CLICOLOR=1
export TERM=xterm-256color
export LSCOLORS=Exfxcxdxbxegedabagacad

# Regular Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White
Orange='\e[38;5;172m'
DarkGreen='\e[38;5;28m'

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Underline
UBlack='\e[4;30m'       # Black
URed='\e[4;31m'         # Red
UGreen='\e[4;32m'       # Green
UYellow='\e[4;33m'      # Yellow
UBlue='\e[4;34m'        # Blue
UPurple='\e[4;35m'      # Purple
UCyan='\e[4;36m'        # Cyan
UWhite='\e[4;37m'       # White

# Load version control information
autoload -Uz vcs_info
autoload -U colors && colors
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '%b'

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
PROMPT='%F{green}%*%f %n %F{cyan}${PWD/#$HOME/~}%f %F{magenta}${vcs_info_msg_0_}%f$ '


#going to a mycase directory
#replacing with just cdmc to hardcoded app
#cdmc()
#{
#  cd ~/mycase/mycase_"$1"
#}

# time in dark green, cwd in orange, purple git prompt $
# PS1="\[$DarkGreen\]\t \[$Orange\]\w \[$UPurple\]\$(git_prompt)\[$Black\]\$ "
# [ -f ~/.fzf.bash ] && source ~/.fzf.bash

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -Uz compinit
compinit
#compdef clyde
_clyde() {
  eval $(env COMMANDLINE="${words[1,$CURRENT]}" _CLYDE_COMPLETE=complete-zsh  clyde)
}
if [[ "$(basename -- ${(%):-%x})" != "_clyde" ]]; then
  compdef _clyde clyde
fi

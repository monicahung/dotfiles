export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

export NVM_DIR="/Users/monica.hung/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

alias rt="CHROME_DEBUG=1 bundle exec ruby -I'lib:test'"
alias bsh="mvim ~/.bash_profile"
alias rebsh="source ~/.bash_profile"
alias repow="touch ~/.pow/restart.txt"
alias vimrc="mvim ~/.vimrc"
alias rmswp="find . -type f -name \".*.swp\" -exec rm -f {} \;"
alias setup="git pull && bundle && bin/rails db:migrate && bin/yarn"
alias rgi="rg -i"

# git stuff
alias gpoh="git push origin HEAD"
alias gs="git status"
alias grbc="git rebase --continue"
alias gcmt="git commit -m"


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

git_prompt ()
{
  if ! git rev-parse --git-dir > /dev/null 2>&1; then
    return 0
  fi

  git_branch=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')

  if git diff --quiet 2>/dev/null >&2; then
    git_color="${c_git_clean}"
  else
    git_color="${c_git_cleanit_dirty}"
  fi

  echo "$git_branch"
}

cdmc()
{
  cd ~/mycase/mycase_"$1"
}

PS1="\[$DarkGreen\]\t \[$Orange\]\w \[$UPurple\]\$(git_prompt)\[$Black\]\$ "
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
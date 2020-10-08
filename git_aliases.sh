alias s="git status -sb"

alias ac="git add --all && git commit -m";

#usage acp "my commit message"
acp ()
{
    git add --all 
    git commit -m "$1"
    git push
}

alias gl="git log --oneline --all --graph --decorate"

# the following hasn't been tested, found on: https://dev.to/leolanese/customising-our-bash-shell-fbb

## git
#   ------------------------------------------------------------
# list remote branches
alias git-remote=" git branch -r "

# delete all local branches but master, develop and staging
alias git-purge=' git branch --merged | grep -v "\*" | grep -v "master" | grep -v "develop" | grep -v "staging" | xargs -n 1 git branch -d '

# Git remote branches and last commit
alias git-remote-branches=" git for-each-ref --sort=-committerdate refs/remotes/origin --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))' "

alias git-merge=" git difftool "
alias git-branch=" git branch -a "
alias git-log1=" git log --graph --oneline --all --decorate --color "
alias git-log2=" git log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short "
alias git-log3=" git log --pretty=oneline "
alias git-log4=" git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit "
alias git-log5=" git whatchanged -3 -p "
alias git-users=" git log --format='%aN' | sort -u "
alias git-diff=" git log -p "
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all &'
alias git-i=" git add -i "
alias git-me=" git log --author=LeoLanese "
alias git-remote=" git remote -v "
alias git-clean=" find . -name .DS_Store -print0 | xargs -0 git rm --ignore-unmatch; 
        git config --global core.excludesfile ~/.gitignore;
        echo .DS_Store >> ~/.gitignore "
alias git-all-users='git log --format='%aN' | sort -u '
alias git-tasks=' grep --exclude-dir=.git -rEI "TODO|FIXME" . 2>/dev/null '

#alias git-last='for k in 'git branch|sed s/^..//';do echo -e 'git log -1 --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" "$k"'\\t"$k";done|sort'

alias git-ignore=' find . \( -type d -empty \) -and \( -not -regex ./\.git.* \) -exec touch {}/.gitignore \; '
alias git-undelete=' git checkout $(git rev-list -n 1 HEAD -- "$file")^ -- "$file" '
alias git-idea=' git rm -r --cached .idea '
alias n=' NODE_ENV=development grunt server '
alias sprint-start=" git branch -D 'git branch | grep -E 'IVMA-..*'' "  
alias contributors=' git shortlog -sn '
alias git-name=' git config user.name '
# Revert All Local Changes
alias git-reverse=' git checkout . '
# Show changes
alias git-show=' git diff --staged '
# Modify The Most Recent Commit
alias git-commits=' git commit --amend '
# Interactively Add Selected Parts of Files
alias git-parts=' git add -p '
# Interactively Stash Selected Parts of Files
alias git-stash=' git stash -p '
# Stash with untracked
alias git-tracks=' git stash -u '
# Interactively Revert Selected Parts of Files
alias git-revert=' git checkout -p '
# Switch to Previous Branch
alias git-switch=' git checkout - '
# Rename Branches Locally
alias git-rename=' git branch -m old-name new-name '
# Open All Files with Conflicts at Once
alias git-open=' git diff --name-only --diff-filter=U | uniq  | xargs $EDITOR '
# What changed in the last 2 weeks?
alias git-whatchanged='  git whatchanged —-since="2 weeks ago" '
# Optimize the repository locally
alias git-gc=' git gc --prune=now --aggressive '
# git manual & help
alias git-help=' git help workflows '
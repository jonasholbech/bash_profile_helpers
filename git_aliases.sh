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
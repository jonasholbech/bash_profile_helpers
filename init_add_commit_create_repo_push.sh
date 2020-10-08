# usage: iamawesome "my commit message"
# commit message defaults to "And so, it begins"
iamawesome ()
{
    message=${1:-'And so, it begins.'}
    git init
    git add .
    git commit -m "$message"
    hub create
    git push -u origin HEAD
}
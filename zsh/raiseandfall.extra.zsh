# NVM
source ~/.nvm/nvm.sh

# GIT
GIT_AUTHOR_NAME="raiseandfall"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="druidev+github@gmail.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"

# Load extra protected stuff ( that we don't want to track with git )
source ~/.extra-protected

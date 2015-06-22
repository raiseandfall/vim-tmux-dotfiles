# NVM
source ~/.nvm/nvm.sh

# GIT
GIT_AUTHOR_NAME="raiseandfall"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="matthieu@johnmcneilstudio.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"

# DOCKER
DOCKER_HOST=tcp://192.168.59.103:2376
DOCKER_CERT_PATH=/Users/matthieu/.boot2docker/certs/boot2docker-vm
DOCKER_TLS_VERIFY=1

# Load extra protected stuff ( that we don't want to track with git )
source ~/.extra-protected

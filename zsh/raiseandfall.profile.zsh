if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

export PYENV_ROOT=/usr/local/var/pyenv
export GOPATH=$HOME/go

# Karn overrides git ( for multiple identities )
if which karn > /dev/null; then eval "$(karn init)"; fi

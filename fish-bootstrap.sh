curl -L https://get.oh-my.fish > install
fish install --path=~/.local/share/omf --config=~/.config/omf

echo "set -x PATH \"\$HOME/.pyenv/bin\"" >> ~/.config/fish/conf.d/omf.fish
echo ". (pyenv init - | psub)" >> ~/.config/fish/conf.d/omf.fish

# Install env, themes and plugins
omf install https://github.com/jhillyerd/plugin-git
omf install nvm
omf install chain

# Install python using pyenv
set LDFLAGS "-L/usr/local/opt/openssl/lib"
set CPPFLAGS "-I/usr/local/opt/openssl/include"
set CFLAGS "-I/usr/local/opt/openssl/include"

pyenv install -v 3.10

# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
echo "set -gx NVM_DIR \$HOME/.nvm" >> ~/.config/fish/conf.d/omf.fish
nvm install 16.10.0
npm i yarn npm -g

# Configure aliases
alias l='ls -hal'
funcsave l

alias gg="git log --oneline --graph"
funcsave gg

alias po="git pull origin (git branch --show-current)"
funcsave po

alias pb="git push origin (git branch --show-current)"
funcsave pb

alias gc="git branch --show-current | pbcopy; git checkout master; git branch -D (pbpaste); po"
funcsave gc

alias grr="git add .; git commit --amend --no-edit"
funcsave grr

alias sloc="git diff --shortstat (git hash-object -t tree /dev/null)"
funcsave sloc

# Configure bin paths
fish_add_path $HOME/bin
fish_add_path $HOME/go/bin/

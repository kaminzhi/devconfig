alias neofetch='neofetch --ascii $HOME/Project/ascii-image-converter-git/image/anime-art.txt'

if status is-interactive
    neofetch
end

#export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
#export PATH="/root/.loacl/share/gem/ruby/3.0.0/bin:$PATH"
#export PATH="$PATH:$GEM_HOME/bin"

set fish_greeting "Hello, $USER!"

set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
alias vim nvim
alias ls "exa -S --icons"
alias ll "exa -S -l --icons"
alias dev "bash ~/.config/tmux/script/ide.sh"

#alias fp "cat /etc/services | fzf"
alias g git
command -qv nvim && alias vim nvim

set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

# NVM
function __check_rvm --on-variable PWD --description 'Do nvm stuff'
    status --is-command-substitution; and return

    if test -f .nvmrc; and test -r .nvmrc
        nvm use
    else
    end
end

switch (uname)
    case Darwin
        source (dirname (status --current-filename))/config-osx.fish
    case Linux
        source (dirname (status --current-filename))/config-linux.fish
    case '*'
        source (dirname (status --current-filename))/config-windows.fish
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
    source $LOCAL_CONFIG
end

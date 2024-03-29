if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Check if starship is installed, else install starship
#if [ ! -e /usr/local/bin/starship ]
#    curl -fsSL https://starship.rs/install.sh -O install.sh
#    chmod +x install.sh && ./install.sh
#end
#starship init fish | source
export EDITOR="vim"
alias please="sudo"
alias xclip="xclip -sel clip"
if command -q exa
    alias lss="exa -la"
    alias ls="exa -l --icons"
    alias l="exa"
end

if command -q fdfind
    alias fd="fdfind"
end

if command -q nvim
    alias vim="nvim"
end

if [ (echo $TERM) = "xterm-kitty" ]
    alias ssh="kitty +kitten ssh"
end

if test -z (pgrep ssh-agent -o)
  eval (ssh-agent -c)
  set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
  set -Ux SSH_AGENT_PID $SSH_AGENT_PID
  set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
end

alias cht="cht.sh"
alias discord="discord --ignore-gpu-blocklist --disable-features=UseOzonePlatform --enable-features=VaapiVideoDecoder --use-gl=desktop --enable-gpu-rasterization --enable-zero-copy"
alias hex="math --base=hex"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/maxh/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<


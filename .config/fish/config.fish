if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Check if starship is installed, else install starship
if [ ! -e /usr/local/bin/starship ]
    curl -fsSL https://starship.rs/install.sh -O install.sh
    chmod +x install.sh && ./install.sh
end
starship init fish | source
export EDITOR="vim"
alias please="sudo"
alias xclip="xclip -sel clip"
if command -q exa
    alias lss="exa"
    alias ls="exa -l"
    alias l="exa -la"
end

if command -q nvim
    alias vim="nvim"
end

if [ (echo $TERM) = "xterm-kitty" ]
    alias ssh="kitty +kitten ssh"
end

if test -z (pgrep ssh-agent)
  eval (ssh-agent -c)
  set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
  set -Ux SSH_AGENT_PID $SSH_AGENT_PID
  set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
end

alias cht="cht.sh"
alias discord="discord --ignore-gpu-blocklist --disable-features=UseOzonePlatform --enable-features=VaapiVideoDecoder --use-gl=desktop --enable-gpu-rasterization --enable-zero-copy"

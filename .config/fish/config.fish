if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Check if omf is installed, else install omf
if [ ! -e ~/.local/share/omf ]
  curl -L https://get.oh-my.fish | fish
end
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

alias cht="cht.sh"

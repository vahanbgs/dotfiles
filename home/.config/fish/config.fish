if status is-interactive
    # Commands to run in interactive sessions can go here
    set SHELL fish
    set fish_greeting
    direnv hook fish | source
    starship init fish | source
end

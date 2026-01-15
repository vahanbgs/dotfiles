if status is-interactive
    # Commands to run in interactive sessions can go here
    set SHELL fish
    set fish_greeting

    abbr -a ls lsd -1
    abbr -a ll lsd -l

    direnv hook fish | source
    starship init fish | source
end

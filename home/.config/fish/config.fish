if status is-interactive
    # Commands to run in interactive sessions can go here
    set SHELL fish
    set fish_greeting
    fish_config theme choose "Rosé Pine Moon"

    abbr -a ls lsd -1
    abbr -a ll lsd -l
    abbr -a tree eza --tree --git-ignore

    function jj_sub
        for subcommand in clone fetch init push remote
            if string match --quiet 'jj '$subcommand' ' -- (commandline -j)
                echo git $subcommand
                return 0
            end
        end

        return 1
    end

    abbr -a jj_sub --position anywhere --regex '([a-z]+)' --function jj_sub

    direnv hook fish | source
    starship init fish | source
end

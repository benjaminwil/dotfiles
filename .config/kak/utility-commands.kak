declare-option -hidden bool line_number_highlighter_enabled false
declare-option -hidden bool soft_wrap_enabled false

define-command autosave-all-buffers \
    -docstring "Aliases 'write-all' for documentation when used in hooks." \
    -hidden \
%{ evaluate-commands %{ write-all } }

define-command copy-relative-path \
    -docstring "Uses the pbcopy executable to copy the current relative path to the system clipboard." \
%{ evaluate-commands %sh{ printf "$kak_bufname" | pbcopy } }

define-command load-local-config \
    -docstring "Loads the .kakrc in project root directory if it exists." \
    -hidden \
%sh{
    local_kak_config="$(pwd)/.kakrc"

    [ -f "$local_kak_config" ] &&  \
        sh -c "echo 'try %{ source \"$local_kak_config\" } \
            catch %{ echo -debug cannot autoload \"$local_kak_config\" }'" _ {} \;
}

define-command kill-trailing-whitespace \
     -docstring "Removes all trailing whitespace on every line." \
%{ try %{ execute-keys -draft \%s\h+$<ret>d } }

define-command line-numbers-hide \
    -docstring "Removes the line numbers highlighter from the current buffer." \
    -hidden \
%{
    set-option buffer line_number_highlighter_enabled false
    remove-highlighter window/line-numbers
}

define-command line-numbers-show \
    -docstring "Uses my preferred line number highlighter in the current buffer." \
    -hidden \
%{
    set-option buffer line_number_highlighter_enabled true
    add-highlighter -override window/line-numbers number-lines \
        -hlcursor \
        -min-digits 3 \
        -separator "  "
}

define-command line-numbers-toggle \
    -docstring "Toggles the line numbers highlighter for the current buffer." \
%{
    evaluate-commands %sh{
        if [ "$kak_opt_line_number_highlighter_enabled" = "true" ]; then
            printf "eval line-numbers-hide"
        else
            printf "eval line-numbers-show"
        fi
    }
}

define-command soft-wrap-enable \
    -docstring "Enables soft wrapping in the current buffer." \
    -hidden \
%{
    set-option buffer soft_wrap_enabled true
    add-highlighter -override buffer/soft-wrap wrap \
        -indent \
        -marker "  \ " \
        -width 80 \
        -word
}

define-command soft-wrap-disable \
    -docstring "Disables soft wrapping in the current buffer." \
    -hidden \
%{
    set-option buffer soft_wrap_enabled false
    remove-highlighter buffer/soft-wrap
}

define-command soft-wrap-toggle \
    -docstring "Toggle soft wrapping in the current buffer." \
%{
    evaluate-commands %sh{
        if [ "$kak_opt_soft_wrap_enabled" = "true" ]; then
            printf "eval soft-wrap-disable"
        else
            printf "eval soft-wrap-enable"
        fi
    }
}

define-command use-system-colorscheme \
    -docstring "Attempts to detect the system colorscheme and set a Kakoune colorscheme to match." \
%{
    evaluate-commands %sh{
        system_colourscheme="$(command ,current-system-colours)"
        case "$system_colourscheme" in
            light)
                echo "colorscheme black-on-white"
                ;;
            dark)
                echo "colorscheme terminal"
                ;;
            *)
                echo "colorscheme terminal"
                ;;
        esac
    }
}

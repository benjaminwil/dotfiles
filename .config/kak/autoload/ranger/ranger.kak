define-command ranger-open-all -hidden -params 2 %{ evaluate-commands %sh{
    while read file
    do
        printf "$1 $file\n"
    done < "$2"
}}

define-command ranger-choosefiles %{
    change-directory %sh{ dirname "${kak_buffile}" }
    suspend-and-resume \
        " ranger %sh{pwd} --choosefiles=/tmp/kak-ranger-ch-%val{session} " \
        "ranger-open-all edit /tmp/kak-ranger-ch-%val{session}"
    }

define-command rg-fzy-open -hidden -params 2 %{ evaluate-commands %sh{
    while read file
    do
        printf "$1 \"$file\"\n"
    done < "$2"
}}

define-command rg-fzy-file-selector %{
    suspend-and-resume \
       " rg --files | fzy --lines=99 > /tmp/kak-rg-fzy-fi-%val{client_pid} " \
        "rg-fzy-open edit /tmp/kak-rg-fzy-fi-%val{client_pid}" 
}    

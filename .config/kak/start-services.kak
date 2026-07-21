# Start the Kakoune language server.
evaluate-commands %sh{
    if command -v kak-lsp >/dev/null 2>&1; then
        kak-lsp --kakoune --session $kak_session
    else
        printf "echo -debug 'kak-lsp is not on \$PATH. No server was started.'"
    fi
}

# Start the Kakoune tree-sitter server.
evaluate-commands %sh{
    if command -v kak-tree-sitter >/dev/null 2>&1; then
        kak-tree-sitter -dks --session $kak_session
    else
        printf "echo -debug 'kak-tree-sitter is not on \$PATH. No server was started.'"
    fi
}

" lexima rules for '%','<','<Space>'
"autocmd filetype html call lexima#add_rule({
"    \ 'char': '<',
"    \ 'input_after': '>',
"    \ 'filetype': ['html', 'jinja', 'htmljinja', 'django', 'htmldjango', 'liquid', 'twig', 'html.twig', 'mako', 'xml'],
"    \ })
autocmd filetype html call lexima#add_rule({
    \ 'char': '<Space>',
    \ 'at': '{{\%#',
    \ 'input_after': '<Space>',
    \ 'filetype': ['html', 'jinja', 'htmljinja', 'django', 'htmldjango', 'liquid', 'twig', 'html.twig', 'mako', 'xml'],
    \ })

" Set settings for lightline vim plugin.
let g:lightline = {
  \ 'colorscheme': 'nord',
  \ 'mode_map': {
    \ 'n' : '✨',
    \ 'i' : '✏️',
    \ 'R' : '♻️',
    \ 'v' : '🏗️',
    \ 'V' : '🏗️ L',
    \ "\<C-v>": '🏗️ B',
    \ 'c' : 'C',
    \ 's' : 'S',
    \ 'S' : 'SL',
    \ "\<C-s>": 'SB',
    \ 't': 'T',
  \ },
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
  \   },
  \   'component_function': { 'gitbranch': 'FugitiveHead' },
  \ }

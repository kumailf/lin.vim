" Bigger highlight delay for better performance
let g:Illuminate_delay = 1000

" Highlight color
augroup lin_vim_illuminate_group
    autocmd!
    autocmd VimEnter * hi link illuminatedWord Visual
augroup END

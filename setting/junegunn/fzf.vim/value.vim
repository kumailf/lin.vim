""" Fzf command prefix
let g:fzf_command_prefix = 'Fzf'

""" Make coc-fzf behavior same with fzf.vim
let g:coc_fzf_preview = ''
let g:coc_fzf_opts = []

let s:COC_EXPLORER='coc-explorer'

""" Key mappings

""" 1. text search

" search text
nnoremap <silent> <expr> <space>gr (&filetype == s:COC_EXPLORER ? "\<c-w>\<c-w>" : '').":<C-u>FzfRg<CR>"
" search lines on opened buffers
nnoremap <silent> <expr> <space>l (&filetype == s:COC_EXPLORER ? "\<c-w>\<c-w>" : '').":<C-u>FzfLines<CR>"
" search text on tags
nnoremap <silent> <expr> <space>t (&filetype == s:COC_EXPLORER ? "\<c-w>\<c-w>" : '').":<C-u>FzfTags<CR>"
" search search history
nnoremap <silent> <expr> <space>sh (&filetype == s:COC_EXPLORER ? "\<c-w>\<c-w>" : '').":<C-u>FzfHistory/<CR>"
" search command history
nnoremap <silent> <expr> <space>ch (&filetype == s:COC_EXPLORER ? "\<c-w>\<c-w>" : '').":<C-u>FzfHistory:<CR>"
" search yank history
nnoremap <silent> <expr> <space>y (&filetype == s:COC_EXPLORER ? "\<c-w>\<c-w>" : '').":<C-u>CocFzfList yank<CR>"

""" 2. file search

" search files
nnoremap <silent> <expr> <space>f (&filetype == s:COC_EXPLORER ? "\<c-w>\<c-w>" : '').":<C-u>FzfFiles<CR>"
nnoremap <silent> <expr> <C-p> (&filetype == s:COC_EXPLORER ? "\<c-w>\<c-w>" : '').":<C-u>FzfFiles<CR>"
" search opened buffers
nnoremap <silent> <expr> <space>b (&filetype == s:COC_EXPLORER ? "\<c-w>\<c-w>" : '').":<C-u>FzfBuffers<CR>"
" search history files(v:oldfiles) and opened buffers
nnoremap <silent> <expr> <space>hf (&filetype == s:COC_EXPLORER ? "\<c-w>\<c-w>" : '').":<C-u>FzfHistory<CR>"

""" 3. git search

" search git commits
nnoremap <silent> <expr> <space>gc (&filetype == s:COC_EXPLORER ? "\<c-w>\<c-w>" : '').":<C-u>FzfCommits<CR>"
" search git files
nnoremap <silent> <expr> <space>gf (&filetype == s:COC_EXPLORER ? "\<c-w>\<c-w>" : '').":<C-u>FzfGFile<CR>"
" search git status
nnoremap <silent> <expr> <space>gs (&filetype == s:COC_EXPLORER ? "\<c-w>\<c-w>" : '').":<C-u>FzfGFiles?<CR>"


""" 4. other search

" search marks
nnoremap <silent> <expr> <space>mk (&filetype == s:COC_EXPLORER ? "\<c-w>\<c-w>" : '').":<C-u>FzfMarks<CR>"
" search maps
nnoremap <silent> <expr> <space>mp (&filetype == s:COC_EXPLORER ? "\<c-w>\<c-w>" : '').":<C-u>FzfMaps<CR>"
" search vim commands
nnoremap <silent> <expr> <space>vc (&filetype == s:COC_EXPLORER ? "\<c-w>\<c-w>" : '').":<C-u>FzfCommands<CR>"
" search help tags
nnoremap <silent> <expr> <space>ht (&filetype == s:COC_EXPLORER ? "\<c-w>\<c-w>" : '').":<C-u>FzfHelptags<CR>"


""" 5. coc search

" search symbols based on coc.nvim
nnoremap <silent> <expr> <space>cs (&filetype == s:COC_EXPLORER ? "\<c-w>\<c-w>" : '').":<C-u>CocFzfList symbols<CR>"
" search diagnostics based on coc.nvim
nnoremap <silent> <expr> <space>cd (&filetype == s:COC_EXPLORER ? "\<c-w>\<c-w>" : '').":<C-u>CocFzfList diagnostics<CR>"
" search symbol outlines based on coc.nvim
nnoremap <silent> <expr> <space>co (&filetype == s:COC_EXPLORER ? "\<c-w>\<c-w>" : '').":<C-u>CocFzfList outline<CR>"
" search commands based on coc.nvim
nnoremap <silent> <expr> <space>cc (&filetype == s:COC_EXPLORER ? "\<c-w>\<c-w>" : '').":<C-u>CocFzfList commands<CR>"
" search location based on coc.nvim
nnoremap <silent> <expr> <space>cl (&filetype == s:COC_EXPLORER ? "\<c-w>\<c-w>" : '').":<C-u>CocFzfList location<CR>"

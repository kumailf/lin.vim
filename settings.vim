

" Coc global extensions
let g:coc_global_extensions = ['coc-snippets', 'coc-yank', 'coc-lists', 'coc-html', 'coc-xml', 'coc-clangd', 'coc-cmake', 'coc-pyright', 'coc-rust-analyzer', 'coc-go', 'coc-json', 'coc-tsserver', 'coc-css', '@yaegassy/coc-volar', 'coc-eslint', 'coc-prettier', 'coc-powershell', ]

" Random colorscheme selected on boot
call NextRandomColorScheme()

"""" Gui font
if has("win32") || has("win64")
    " for Windows
    set guifont=Hack\ Nerd\ Font\ Mono:h10
elseif has("mac")
    " for macOS
    set guifont=Hack\ Nerd\ Font\ Mono:h12
else
    " for other *NIX
    set guifont=Hack\ Nerd\ Font\ Mono:h10
endif

"""" Hotkey
" open/close file explorer
if has('nvim-0.7')
  nnoremap <F1> :<C-u>NvimTreeToggle<CR>
else
  nnoremap <F1> :<C-u>Fern -keep -toggle . -drawer<CR>
endif
" toggle (open/close) undo tree
nnoremap <F2> :<C-u>UndotreeToggle<CR>
" toggle (open/close) vista
nnoremap <F3> :<C-u>Vista!!<CR>
" switch between C/C++ header source
nnoremap <F4> :<C-u>CocCommand clangd.switchSourceHeader<CR>
" open browser to preview markdown
nnoremap <F8> :<C-u>MarkdownPreview<CR>
" next color scheme
nnoremap <silent> <F9> :<C-u>call NextRandomColorSchemeSync()<CR>
" open buffer explorer
nnoremap <silent> <F10> :<C-u>BufExplorer<CR>
" close buffer explorer if it's opened
nnoremap <silent> <S-F10> :<C-u>ToggleBufExplorer<CR>

"""" Python3 host
let g:python3_host_prog='python3'

"""" Neovide
let g:neovide_refresh_rate=30
let g:neovide_transparency=1.0
let g:neovide_scroll_animation_length=0.0
let g:neovide_remember_window_size=v:true
let g:neovide_input_use_logo=v:false  " v:true on macOS
let g:neovide_cursor_animation_length=0.0
let g:neovide_cursor_trail_length=0.0
let g:neovide_cursor_antialiasing=v:true

"""" 2 spaces indent for specific languages
" autocmd FileType c,cpp setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab
" autocmd FileType html,xml,xhtml,json,javascript,typescript,javascriptreact,typescriptreact setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab

"""" Add more settings here...


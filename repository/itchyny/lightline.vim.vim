" Only enable statusline, disable tabline

let g:lightline = {
  \ 'active': {
  \   'left': [ ['mode', 'paste'],
  \             ['MyLightLineFileName' ],
  \             ['MyLightLineGitStatus', 'MyLightLineCocStatus', 'MyLightLineGutentagsStatus'] ],
  \   'right': [ [ 'lineinfo' ],
  \              [ 'percent' ],
  \              [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ]
  \ },
  \ 'component': {
  \   'charvaluehex': '0x%B',
  \   'lineinfo': ' %3l:%-2v',
  \ },
  \ 'component_function': {
  \   'MyLightLineFileName'         : 'MyLightLineFileName',
  \   'MyLightLineGitStatus'        : 'MyLightLineGitStatus',
  \   'MyLightLineCocStatus'        : 'MyLightLineCocStatus',
  \   'MyLightLineGutentagsStatus'  : 'MyLightLineGutentagsStatus',
  \ },
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '', 'right': '' },
  \ 'enable': {
  \   'statusline': 1,
  \   'tabline': 0
  \   }
  \ }


function! MyLightLineFileName() abort
    let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
    if &modified
        let filename = filename . '[+]'
    endif
    if &readonly
        let filename = filename . '[-]'
    endif
    return filename
endfunction

" function! MyLightLineCurrentFunction() abort
"     let function_name = get(b:, 'coc_current_function', '')
"     if empty(function_name)
"         return ''
"     endif
"     return printf(' %s', function_name)
" endfunction

function! MyLightLineCocStatus() abort
    if !exists("*coc#status")
        return ''
    endif

    let coc_status = coc#status()
    if empty(coc_status)
        return ''
    else
        return coc_status
    endif
endfunction

function! MyLightLineGitStatus() abort
    """ coc-git
    " let branch = get(g:,'coc_git_status','')
    " if empty(branch)
    "     return ''
    " endif
    " let changes = get(b:,'coc_git_status','')
    " return printf('%s%s', branch, changes)

    """ vim-gitbranch + vim-gitgutter
    if !exists("*gitbranch#name")
        return ''
    endif
    let branch = gitbranch#name()
    if empty(branch)
        return ''
    endif
    if !exists("*GitGutterGetHunkSummary")
        return printf(' %s', branch)
    endif
    let [a,m,r] = GitGutterGetHunkSummary()
    let changes = []
    if a > 0
        call add(changes, printf('+%d', a))
    endif
    if m > 0
        call add(changes, printf('~%d', m))
    endif
    if r > 0
        call add(changes, printf('-%d', r))
    endif
    if empty(changes)
        return printf(' %s', branch)
    else
        return printf(' %s %s', branch, join(changes, ' '))
    endif
endfunction

function! MyLightLineGutentagsStatus() abort
    if !exists("*gutentags#statusline")
        return ''
    endif
    let tags_status = gutentags#statusline()
    if empty(tags_status)
        return ''
    endif
    return tags_status
endfunction

" update lightline
augroup my_lightline_group
    autocmd!
    autocmd User GutentagsUpdating call lightline#update()
    autocmd User GutentagsUpdated call lightline#update()
    autocmd User CocStatusChange call lightline#update()
    autocmd User CocDiagnosticChange call lightline#update()
    autocmd User CocGitStatusChange call lightline#update()
augroup END

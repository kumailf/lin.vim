lua<<EOF
local lin_vim_keymap = {
  -- navigation
  { key = {"l", "o", "<2-LeftMouse>"}, action = "edit" },   -- open folder or edit file
  { key = "h",              action = "close_node" },        -- close folder
  { key = "<CR>",           action = "cd" },                -- cd into folder
  { key = "<BS>",           action = "dir_up" },            -- cd upper folder

  -- split
  { key = "e",              action = "split" },
  { key = "E",              action = "vsplit" },
  { key = "t",              action = "tabnew" },

  -- refresh
  { key = "R",              action = "refresh" },

  -- create/rename/delete
  { key = {"N", "a", "A"},  action = "create" },
  { key = {"r", "m"},       action = "rename" },
  { key = "d",              action = "trash" },
  { key = "D",              action = "remove" },

  -- copy/paste/cut
  { key = "X",              action = "cut" },
  { key = "C",              action = "copy" },
  { key = "V",              action = "paste" },

  -- open in system
  { key = "s",              action = "system_open" },

  -- help
  { key = "?",              action = "toggle_help" },

  -- file info
  { key = "I",              action = "toggle_file_info" },

  -- hidden files
  { key = {"H"},           action = "toggle_dotfiles" },

  -- nvim-tree.lua specifics
  { key = "<",              action = "prev_sibling" },
  { key = ">",              action = "next_sibling" },
  { key = "K",              action = "first_sibling" },
  { key = "J",              action = "last_sibling" },
  { key = "P",              action = "parent_node" },
  { key = "y",              action = "copy_name" },
  { key = "Y",              action = "copy_absolute_path" },
  -- git chunk
  { key = "]c",             action = "next_git_item" },
  { key = "[c",             action = "prev_git_item" },
}

require'nvim-tree'.setup {
  open_on_setup = true,
  open_on_setup_file = false,
  view = {
    width = 40,
    side = "left",
    signcolumn = "yes",
    mappings = {
      custom_only = true,
      list = lin_vim_keymap,
    },
  },
  renderer = {
    highlight_git = true,
    indent_markers = {
      enable = true,
    },
    icons = {
      webdev_colors = true,
      git_placement = "signcolumn",
      glyphs = {
        default = "",
        symlink = "",
      },
    },
  },
  update_focused_file = {
    enable      = true,
    update_root = true,
  },
  git = {
    enable = true,
    ignore = false,
  },
}
EOF

function! s:nvim_tree_settings() abort
  " key mapping

  " resize explorer width
  nnoremap <silent> <buffer> <D-,> :<C-u>NvimTreeResize -10<CR>
  nnoremap <silent> <buffer> <D-Left> :<C-u>NvimTreeResize -10<CR>
  nnoremap <silent> <buffer> <A-,> :<C-u>NvimTreeResize -10<CR>
  nnoremap <silent> <buffer> <A-Left> :<C-u>NvimTreeResize -10<CR>
  nnoremap <silent> <buffer> <M-,> :<C-u>NvimTreeResize -10<CR>
  nnoremap <silent> <buffer> <M-Left> :<C-u>NvimTreeResize -10<CR>
  nnoremap <silent> <buffer> <C-,> :<C-u>NvimTreeResize -10<CR>
  nnoremap <silent> <buffer> <C-Left> :<C-u>NvimTreeResize -10<CR>

  nnoremap <silent> <buffer> <D-.> :<C-u>NvimTreeResize +10<CR>
  nnoremap <silent> <buffer> <D-Right> :<C-u>NvimTreeResize +10<CR>
  nnoremap <silent> <buffer> <A-.> :<C-u>NvimTreeResize +10<CR>
  nnoremap <silent> <buffer> <A-Right> :<C-u>NvimTreeResize +10<CR>
  nnoremap <silent> <buffer> <M-.> :<C-u>NvimTreeResize +10<CR>
  nnoremap <silent> <buffer> <M-Right> :<C-u>NvimTreeResize +10<CR>
  nnoremap <silent> <buffer> <C-.> :<C-u>NvimTreeResize +10<CR>
  nnoremap <silent> <buffer> <C-Right> :<C-u>NvimTreeResize +10<CR>
endfunction

augroup my_nvim_tree_group
  autocmd!
  autocmd FileType NvimTree call s:nvim_tree_settings()
augroup END

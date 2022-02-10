# lin.vim : Lin Rongbin's (Neo)Vim Distribution

lin.vim is a highly configured [VIM](https://www.vim.org/)/[Neovim](https://neovim.io/) integrated tons of utilities for development.

# Table of Contents

- [Introduction](#introduction)
  - [Screenshots](#screenshots)
  - [Feature](#feature)
  - [Project Structure](#project-structure)
- [Installation](#installation)
  - [UNIX, Linux, MacOS](#unix-linux-macos)
  - [Windows](#windows)
  - [Limitation](#limitation)
    - [Third Party Dependencies](#third-party-dependencies)
    - [Tested Platforms](#tested-platforms)
- [User Guide](#user-guide)
  - [Hot Key](#hot-key)
  - [UI](#ui)
    - [File Explorer](#file-explorer)
    - [Opened Buffers](#opened-buffers)
  - [IDE-like Editing Features](#ide-like-editing-features)
    - [Code Complete](#code-complete-by-coc-nvim)
    - [Jumps](#jumps-by-coc-nvim)
    - [Quick Code Actions/Lens](#quick-code-actions-lens-by-coc-nvim)
  - [Search](#search)
    - [Text Search](#text-search)
    - [File Search](#file-search)
    - [Git Search](#git-search)
    - [Other Search](#other-search)
    - [Coc.nvim Search](#coc-nvim-search)
    - [Rg Search](#rg-search)
  - [Other Enhancements](#other-enhancements)
    - [Enhanced Copy Paste](#enhanced-copy-paste)
    - [Easy Alignment](#easy-alignment-by-easy-align)
    - [Easy Cursor Movement](#easy-cursor-movement-by-vim-easymotion)
    - [Fast Repeat](#fast-repeat-by-vim-repeat)
    - [Fast Quotes Operation](#fast-quotes-operation-by-vim-surround)
    - [Match Brackets and HTML Tags](#match-brackets-and-html-tags-by-vim-matchup)
    - [Auto Close Brackets and HTML Tags](#auto-close-brackets-and-html-tags-by-auto-pairs-and-vim-closetag)
    - [Easy Comment](#easy-comment-by-nerdcommenter)
  - [Customization](#customization)
    - [GUI Fonts](#gui-fonts)
  - [Command Line Utility (vcmd)](#command-line-utility-vcmd)
- [Contribute](#contribute)

## Introduction

lin.vim is aimed to out of box, IDE-like editing features, after high performance, light weight and friendly to most (Neo)VIM users.

lin.vim is focused on and only on editing, it doesn't compiling/packaging/debugging projects, not a tutorial for new (Neo)VIM users neither.

lin.vim solved such issues:

- Solved the difficulty of choosing/grouping/configuring plugins, a list of plugins are embeded and well configured which meets most needs.
- Solved the difficulty of repeatly installing vim on different OS and machines, installation are been made easy by one shell command (not on Windows for now).
- Solved the performance/feature/looking issue on naive (neo)vim, only carefully chosen plugins are installed by default, try to be a modern editor just like [vscode](https://code.visualstudio.com/), pretty colorschemes/UI/icons try to make you happy working.
- Command line utilities implemented by python3 for easier daily working.
- Wiki for everything so nothing confused you.
- Customization ability for special needs.

### Screenshots

#### Simple but pretty UI

![edit-markdown.png](https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/edit-markdown.png)

#### Code complete for C++

![cplusplus-code-complete.png](https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/cplusplus-code-complete.png)

#### Fast cursor movement

![fast-cursor-movement.png](https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/fast-cursor-movement.jpg)

#### Search text

![search-text.png](https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/search-text.png)

#### Search files

![search-files.png](https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/search-files.png)

#### Markdown preview

![markdown-preview.png](https://raw.githubusercontent.com/linrongbin16/lin.vim.github.io/main/screen-snapshots/markdown-preview.jpg)

### Feature

- Automatically installation.
- Running on multiple platforms: Windows, macOS and Linux(Ubuntu/Debian/Fedora/Manjaro).
- Support both [VIM](https://www.vim.org/) and [Neovim](https://neovim.io/).
- Modern UI such as file explorer, pretty icons, Plentiful randomly selected color schemes on start, opened buffers, file status line, outline/tags, etc.
- Code complete, lint/diagnostic, format, symbol jumps, codeLens/codeActions, highlight for most programming languages by [coc.nvim](https://github.com/neoclide/coc.nvim) and [TabNine](https://www.tabnine.com/)(by using coc-tabnine, please login if you want full power of it), embeded C/C++/Python3/Rust language servers.
- Search engine by [fzf.vim](https://github.com/junegunn/fzf.vim), (optional [bat](https://github.com/sharkdp/bat) for preview and [fd](https://github.com/sharkdp/fd) for directory searching), supprot text search such as text/lines/tags/search-histories/command-histories, file search such as files/buffers, git search such as commits/changes, coc.nvim integrated search such as symbols/outline/diagnostics/coc-yank.
- Command line utilities implemented by python3, working with git, text search, encoding/decoding, file operation, compression/extraction, datetime calculation, ip calculation, etc.
- Use [zsh](https://www.zsh.org/) for macOS/Linux with pretty prompt.
- Custom configuration.

### Project Structure

```
 |+command              Command line utilities(vcmd) implemented in python3.
 |+install              Installation scripts for all platforms.
 |+setting              VimL script settings.
 |+template             Templates for user-settings.vim, coc-settings.json, vim-plug.vim and .linvimrc.
 |`install.sh           UNIX/Linux/MacOS bash installation script.
 |`install.ps1          Windows PowerShell installation script.
 |`LICENSE              The license file.
 |`lin.vim              The .vimrc file.
 |`README.md            Readme wiki.
```

## Installation

### UNIX, Linux, MacOS

```bash
    $ git clone https://github.com/linrongbin16/lin.vim ~/.vim && cd ~/.vim && ./install.sh
```

### Windows

1. Install [Visual Studio](https://www.visualstudio.com/) with at least these options:

   - .NET Desktop Development
   - Visual C++ Desktop Development
   - Common Windows Platform Development

2. Install third party dependencies (x64 is preferred):

   - [git](https://git-scm.com/downloads): add `git.exe` in `$env:Path`
   - (Optional) [make](http://gnuwin32.sourceforge.net/packages/make.htm): add `make.exe` in `$env:Path`
   - [cmake](https://cmake.org/download/): add `cmake.exe` in `$env.Path`
   - [gvim](https://github.com/vim/vim-win32-installer/releases): add `gvim.exe` in `$env.Path`
   - (Optional) [neovim](https://github.com/neovim/neovim/releases): add `nvim.exe` in `$env.Path`
   - [python3](https://www.python.org/downloads/): since python3 installer don't provide `python3.exe` and `pip3.exe`, manually copy `python.exe` to `python3.exe`, copy `pip.exe` to `pip3.exe`, then add them in `$env.Path`
   - [llvm](https://releases.llvm.org/): add `clang.exe`, `clang++.exe`, `clangd.exe`, `clang-tidy.exe`, `clang-format.exe` in `$env.Path`
   - [rust](https://www.rust-lang.org/tools/install): add `rustc.exe`, `cargo.exe` in `$env.Path`
   - [golang](https://go.dev/dl/): add `go.exe` in `$env.Path`
   - [nodejs](https://nodejs.org/en/download/): add `node.exe`, `npm.exe` in `$env.Path`
   - [ripgrep](https://github.com/BurntSushi/ripgrep/releases): add `rg.exe` in `$env.Path`
   - [universal-ctags](https://github.com/universal-ctags/ctags-win32/releases): add `ctags.exe`, `readtags.exe` in `$env.Path`
   - [7z](https://www.7-zip.org/download.html): add `7z.exe` in `$env.Path`

Notice: installed python3 version must be compatible with gvim/neovim's libpython3.so version, or gvim/neovim will not detect python3. Please use `gvim --version` to find its libpython3.so version.

You could also install these dependencies with other windows package manager such as [chocolatey](https://chocolatey.org/) or [scoop](https://scoop.sh/), just make sure these commands are available in `$env.Path`.

3. Install following components as administrator:

```bash
    $ git clone https://github.com/linrongbin16/lin.vim $env:UserProfile\.vim
    $ cd $env:UserProfile\.vim
    $ .\install.ps1
```

4. Add `$env:UserProfile\.vim\command` in `$env:Path`.

5. Install [Hack Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases), `install.ps1` script will automatically download and save it as `$env:UserProfile\.vim\guifonts\Hack.zip`, please manually install the following fonts:
   - `Hack Bold Nerd Font Complete Mono Windows Compatible.ttf`
   - `Hack Bold Italic Nerd Font Complete Mono Windows Compatible.ttf`
   - `Hack Italic Nerd Font Complete Mono Windows Compatible.ttf`
   - `Hack Regular Nerd Font Complete Mono Windows Compatible.ttf`

### Limitation

#### Third Party Dependencies

[install.sh](https://github.com/linrongbin16/lin.vim/blob/master/install.sh) will install third party dependencies automatically through package manager, which could conflict with your systems:

- git, curl, wget
- (g)vim/neovim (macvim is installed on macOS)
- llvm (clang, clang++, clangd, clang-format)
- rust
- golang
- autoconf, automake, make, cmake (make is optional on windows, gcc/g++ is additionally installed on Linux)
- ripgrep(rg)
- zip, unzip, bzip2, p7zip (7z installed on Windows as an alternative)
- python3, pip3
- nodejs, npm
- universal-ctags
- zsh (not installed on Windows)
- hack nerd font (only download on Windows, need manually installation)

Notice: installation needs access of websites below, and make sure they're available:

- [github.com](https://github.com/)
- [raw.githubusercontent.com](https://raw.githubusercontent.com/)
- [crates.io](https://crates.io/)

#### Tested Platforms

| Software Dependency | Version Info |
| ------------------- | ------------ |
| (g)vim/macvim       | 8.1+         |
| neovim              | 0.5.0+       |
| python3             | 3.6+         |
| nodejs              | 10.12+       |

| Operating System       | (Neo)Vim               | Python                        | Nodejs                        | Test Result                                                                                                                              |
| ---------------------- | ---------------------- | ----------------------------- | ----------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| MacOS Catalina 10.15.7 | Macvim 8.2 -lpython3.9 | python 3.9.1 with pip3 20.3.1 | node v15.5.0 with npm 7.3.0   | **_success_**                                                                                                                            |
| Windows 10             | Gvim 8.2 -lpython3.8   | python 3.8.0                  | node v15.4.0 with npm 7.0.15  | **_success_**                                                                                                                            |
| Ubuntu 20.04 LTS       | Gvim 8.1 -lpython3.8   | python 3.8.5 with pip3 20.0.2 | node v14.5.3 with npm 6.14.9  | **_success_**                                                                                                                            |
| Fedora Workstation 32  | Gvim 8.2 +python3/dyn  | python 3.8.6 with pip3 19.3.1 | node v12.19.0 with npm 6.14.8 | **_success_**                                                                                                                            |
| Manjaro 20.2           | Gvim 8.2 +python3/dyn  | python 3.8.6 with pip3 20.2   | node v15.3.0 with npm 6.14.8  | **_success_**                                                                                                                            |
| Ubuntu 16.04 LTS       | Gvim 7.4 -lpython3.5   | python 3.5.2 with pip 8.1.1   | node v14.5.3 with npm 6.14.9  | **_partial failure_**<br>1) python formatter **_black_** need at least python 3.6<br>2) coc.nvim and coc-list need at least vim 8.1+<br> |

## User Guide

In this section, VIM edit mode are specified with:

- 🄽 - Normal Mode
- 🅅 - Visual Mode
- 🄸 - Insert Mode

### Hot Key

- `F1` 🄽 - toggle(open/close) fern file explorer, see [Simple but pretty UI](#simple-but-pretty-ui).
- `F2` 🄽 - toggle(open/close) vista outline/tags, see [Code complete for C++](#code-complete-for-c).
- `F3`/`SHIFT-F3` 🄽 - format/sync-format current file.
- `F4` 🄽 - switch between C/C++ header and source files.
- `F5` 🄽 - run codeLens on current file.
- `SHFIT-F5` 🄽 - quick auto-fix(run codeActions) on current line.
- `F6` 🄽 - hover symbol.
- `SHIFT-F6` 🄽 - rename symbol.
- `F7` 🄽 - open markdown preview window in browser, see [Markdown preview](#markdown-preview).
- `F8` 🄽 - change color theme randomly, see [Screenshots](#screenshots).
- `F10`/`SHIFT-F10` 🄽 - open/close(toggle) opened buffers explorer.

You could configure these keys in **_user-settings.vim_**.

### UI

#### File Explorer

File explorer is supported by [fern.vim](https://github.com/lambdalisue/fern.vim), you could use key mappings on the file explorer left side:

- `N/K` 🄽 - create new file/directory.
- `m` 🄽 - move file/directory.
- `c` 🄽 - copy file/directory.
- `R` 🄽 - rename file/directory.
- `D` 🄽 - delete file/directory to trash.
- `h` 🄽 - leave or collapse directory.
- `l` 🄽 - open or expand directory.
- `<cr>` 🄽 - open file or cd into directory.
- `<bs>` 🄽 - leave directory and goto upper directory.
- `<F5>` 🄽 - reload file explorer.

Please refer to [fern.vim - wiki - Mappings](https://github.com/lambdalisue/fern.vim/wiki/Mappings) fore more key mappings.

#### Opened Buffers

Buffers can be switched/closed by key mappings:

- `<leader>bn`/`<c-tab>` 🄽 - go to next buffer.
- `<leader>bp`/`<c-s-tab>` 🄽 - go to previous buffer.
- `<leader>bd` 🄽 - close current buffer.
- `F10`/`SHIFT-F10` 🄽 - open/close(toggle) opened buffers explorer.

### IDE-like Editing Features

#### Code Complete (by coc.nvim)

- `<c-n>`/`tab`/`<down>` 🄸 - select next suggestion.
- `<c-p>`/`<s-tab>`/`<up>` 🄸 - select previous suggestion.
- `<esc>`/`<c-[>` 🄸 - quit suggestion.

#### Jumps (by coc.nvim)

- `[g` 🄽 - go to previous diagnostic location.
- `]g` 🄽 - go to next diagnostic location.
- `gd` 🄽 - go to definition.
- `gy` 🄽 - go to type(function) definition.
- `gi` 🄽 - go to implemention.
- `gr` 🄽 - go to references.
- `K` 🄽 - show hover(symbol definition).

#### Quick Code Actions/Lens (by coc.nvim)

- `<leader>rs`/`<s-F6>` 🄽 - rename symbol.
- `<leader>cs` 🄽 - run code actions on selected code.
- `<leader>ca` 🄽 - run code actions on current buffer.
- `<leader>cl`/`<F5>` 🄽 - run code lens on current line.
- `<leader>qf`/`<s-F5>` 🄽 - apply quick fix on current line.

### Search

Search engine use fzf.vim and integrated with coc.nvim with [coc-fzf](https://github.com/antoinemadec/coc-fzf), all fzf commands are configured with prefix **Fzf**, for example `:Files` are renamed to `:FzfFiles`, `:Rg` are renamed to `:FzfRg`.

#### Text Search

- `<space>gr` 🄽 - search text by `:FzfRg`.
- `<space>l` 🄽 - search lines on opened buffers by `:FzfLines`.
- `<space>t` 🄽 - search tags by `:FzfTags`.
- `<space>sh` 🄽 - search search history by `:FzfHistory/`.
- `<space>ch` 🄽 - search vim command history by `:FzfHistory:`.

#### File Search

Implement by fzf.vim.

- `<space>f`/`<c-p>` 🄽 - search files by `:FzfFiles`.
- `<space>b` 🄽 - search opened buffers by `:FzfBuffers`.
- `<space>hf` 🄽 - search history files (v:oldfiles) and opened buffers by `:FzfHistory`.

#### Git Search

Implement by fzf.vim.

- `<space>gc` 🄽 - search git commits by `:FzfCommits`.
- `<space>gf` 🄽 - search git files rby `:FzfGFile`.
- `<space>gs` 🄽 - search git status(also diff files by preview) by `:FzfGFiles?`.

#### Other Search

- `<space>mk` 🄽 - search marks by `:FzfMarks`.
- `<space>mp` 🄽 - search normal mode vim key mappings by `:FzfMaps`.
- `<space>vc` 🄽 - search vim commands by `:FzfCommands`.
- `<space>ht` 🄽 - search help tags by `:FzfHelptags`.

#### Coc.nvim Search

Key mappings are configured with prefix char `c` after `<space>`.

- `<space>cs` 🄽 - search symbols by `:CocFzfList symbols`. Notice this will only work on NeoVIM, fallback to `:CocList symbols` on VIM.
- `<space>cd` 🄽 - search diagnostics by `:CocFzfList diagnostics`.
- `<space>co` 🄽 - search outline/tags by `:CocFzfList outline`.
- `<space>cy` 🄽 - search coc-yank by `:CocFzfList yank`.
- `<space>cc` 🄽 - search commands by `:CocFzfList commands`.
- `<space>cl` 🄽 - search location by `:CocFzfList location`.

Please visit [fzf.vim](https://github.com/junegunn/fzf.vim) and [coc-fzf](https://github.com/antoinemadec/coc-fzf) for more information.

#### Rg Search

`:Rg` command is still supported by [vim-ripgrep](https://github.com/jremmen/vim-ripgrep) as an old-style search method.

### Other Enhancements

#### Enhanced Copy Paste

Enhanced copy-paste are supported when you want copy/paste between different vim instances.

- `<leader>y` 🅅 - copy visual-selected text to locale machine cache `~/.vim/.lin-vim-enhanced-copy-paste`.
- `<leader>p` 🄽 - paste text saved from local machine cache `~/.vim/.lin-vim-enhanced-copy-paste`.

Copied content will be stored in a text file, then you could paste them to other vim instances.

You could configure these keys in **_user-settings.vim_**.

#### Easy Alignment by [easy-align](https://github.com/junegunn/vim-easy-align)

- `vipga=` 🅅 - align visual-selected paragraph.
- `gaip=` 🄽 - align inner paragraph.

Please visit [easy-align](https://github.com/junegunn/vim-easy-align) for more usage.

#### Easy Cursor Movement by [vim-easymotion](https://github.com/easymotion/vim-easymotion)

See [Fast cursor movement](#fast-cursor-movement).

- `<leader>f{char}` 🄽 - move to a single {char}.
- `<leader>s{char}{char}` 🄽 - move to consequent two {char}{char}.
- `<leader>w` 🄽 - move to word.
- `<leader>L` 🄽 - move to specified line.
- `<leader>j` 🄽 - go to forward line below cursor.
- `<leader>k` 🄽 - go to backward line above cursor.

Please visit [vim-easymotion](https://github.com/easymotion/vim-easymotion) for more usage.

#### Fast Repeat by [vim-repeat](https://github.com/tpope/vim-repeat)

Enhancement for `.` operation.

Please visit [vim-repeat](https://github.com/tpope/vim-repeat) for more information.

#### Fast Quotes Operation by [vim-surround](https://github.com/tpope/vim-surround)

Enhancement for add/remove quotes operation.

Please visit [vim-surround](https://github.com/tpope/vim-surround) for more information.

#### Match Brackets and HTML Tags by [vim-matchup](https://github.com/andymass/vim-matchup)

Enhancement for brackets(pairs) and html tags.

Please visit [vim-matchup](https://github.com/andymass/vim-matchup) for more usage.

#### Auto Close Brackets and HTML Tags by [auto-pairs](https://github.com/jiangmiao/auto-pairs) and [vim-closetag](https://github.com/alvan/vim-closetag)

Enhancement for auto close brackets(pairs) and html tags.

Please visit [auto-pairs](https://github.com/jiangmiao/auto-pairs) and [vim-closetag](https://github.com/alvan/vim-closetag) for more usage.

#### Easy Comment by [nerdcommenter](https://github.com/preservim/nerdcommenter)

The most popular key mappings are:

- `<leader>cc` 🄽🅅 - comment current line or selected lines.
- `<leader>cn` 🄽🅅 - comment current line or selected lines with force nesting.
- `<leader>c<space>` 🄽🅅 - toggle current line or selected lines.

Please visit [nerdcommenter](https://github.com/preservim/nerdcommenter) for more usage and configuration.

### Customization

Please custom your own settings in **_user-settings.vim_** and **_coc-settings.json_**.

#### GUI Fonts

[Hack Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases) is installed by default(only downloaded on Windows and need manually install). Please manually install other fonts and configure font settings in `~/.vim/user-settings.vim` if you want to customize gui fonts.

### Command Line Utility (vcmd)

A bunch of command line utilities are implemented by python3 to speed up your edit and development, named **_vcmd_**.
**_vcmd_** simplifies common operations in most scenarios of developing and editing, include:

- `vencode`: Encode/decode text strings.
- `vfile`: File operations such as a) delete files with a specified filetype, b) replace content in files with a specified filetype, c) list files with a specified filetype, d) detect and convert file encodings with a specified filetype.
- `vconf`: Configure `compile_commands.json` for C/C++ language server clangd, generate ssh key for host, homebrew/python-pip/ubuntu/fedora/manjaro... mirrors to speed up, etc.
- `vgit`: Git operations without the burden of time consuming remember.
- `vip`: Ip address calculations for both ipv4 and ipv6.
- `vpack`: Easier file/directory compression and extraction.
- `vgp`: Fast text searcher.
- `vtime`: Easier time calculations.

For better understanding and use, help document is supported for all commands, contains command functionality, options and examples.
Here's an example of `vencode`:

```
$ vencode --help
Usage: vencode [OPTIONS] [ARGS]...

  Encode/decode text with algorithm

Options:
  -e, --encode [base64|url]  encode text with specified algorithm
  -d, --decode [base64|url]  decode text with specified algorithm
  --help                     Show this message and exit.

Examples:
  $ vencode -ebase64 'Hello World'
  `Hello World` => `SGVsbG8gV29ybGQ=`
```

Please try `--help` for more details.

## Contribute

Please open issue/PR for anything about lin.vim.

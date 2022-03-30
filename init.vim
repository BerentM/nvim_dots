" PLUGS {{{
call plug#begin(expand('~/.vim/plugged'))
	" TELESCOPE
	" install ripgrep -> scoop install ripgrep
	" make sure that "make" is there -> scoop install make
	Plug 'nvim-lua/popup.nvim'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
	Plug 'nvim-telescope/telescope-file-browser.nvim'

	" LSP
	Plug 'neovim/nvim-lspconfig'
	" LSP autocomplete
	Plug 'hrsh7th/nvim-cmp'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'L3MON4D3/LuaSnip'
	Plug 'saadparwaiz1/cmp_luasnip'

    " GIT
	Plug 'tpope/vim-fugitive'                   " git
    Plug 'lewis6991/gitsigns.nvim'              " show git icons

    " SNIPPETS
    Plug 'L3MON4D3/LuaSnip'
    Plug 'rafamadriz/friendly-snippets'

    " DEBUGGER - DAP
    Plug 'mfussenegger/nvim-dap'
    Plug 'leoluz/nvim-dap-go'                   " requires delve debugger
    Plug 'mfussenegger/nvim-dap-python'         " requires debugpy
    Plug 'rcarriga/nvim-dap-ui'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'theHamsta/nvim-dap-virtual-text'
    Plug 'nvim-telescope/telescope-dap.nvim'

    " MISC
    Plug 'ThePrimeagen/harpoon'
	Plug 'jiangmiao/auto-pairs'                 " close brackets
	Plug 'justinmk/vim-sneak'                   " jump to two specific characters
	Plug 'wellle/targets.vim'                   " better changing and modifying in brackets
	Plug 'tpope/vim-surround'                   " bracket closing
	Plug 'tpope/vim-commentary'                 " smarter comments

	Plug 'skywind3000/asynctasks.vim'           " running programs in async manner
	Plug 'skywind3000/asyncrun.vim'

    Plug 'akinsho/bufferline.nvim'              " better buffer display
    Plug 'kyazdani42/nvim-tree.lua'             " catalog tree
    Plug 'stevearc/aerial.nvim'                 " object/symbol tree on the right side

    Plug 'vim-test/vim-test'                    " better testing

    " VISUALS
	Plug 'arcticicestudio/nord-vim'             " nord theme
    Plug 'rebelot/kanagawa.nvim'                " kanagawa theme
    Plug 'nvim-lualine/lualine.nvim'            " statusline
    Plug 'SmiteshP/nvim-gps'                    " show better context of actual line in lualine bar
    Plug 'kyazdani42/nvim-web-devicons'         " colorfull icons ie. for bufferline
    Plug 'folke/todo-comments.nvim'             " highlight todo comments

call plug#end()
" }}}
" REMAPS {{{

" Cutting, pasting, copying from and to system clipboard
map <C-x> "+d
map <C-y> "+y
map <C-p> "+p
map <C-P> "+P

" Map space to <leader>
let mapleader = " "

" Save as root
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Create new line above/below current line
inoremap jj <C-o>o
inoremap kk <C-o>O

" Remap esc to jk
inoremap jk <esc>

" Quick save
nnoremap <silent> <leader>w :w <CR>

" GIT
nnoremap <silent> <leader>gg :Git<CR>

" Reload gitsigns due to race condition error during start
nnoremap <silent> <leader><leader>g :Gitsigns setup<CR>

" ReSource whole vim
nnoremap <silent> <Leader><Leader>s :source $MYVIMRC<cr>
" Edit init.vim
nnoremap <silent> <Leader><Leader>e :e $MYVIMRC<cr>

"}}}
" LOAD LUA CONFIG AND SET PYTHON ENV {{{
lua require("conf")

" Make it easy to load pynvim in each of the virtual envs
if has('win64') || has('win32') || has('win16')
    let g:python3_host_prog = 'C:\Users\beren\scoop\apps\python\current\python.exe'
    let g:fugitive_git_executable = 'C:\\Program\ Files\\Git\\cmd\\git.exe'
endif

" }}}
" VIM-TEST {{{

nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" }}}
" NVIM-TREE {{{

let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_icon_padding = ' ' "one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
let g:nvim_tree_symlink_arrow = ' >> ' " defaults to ' ➛ '. used as a separator between symlinks' source and target.
let g:nvim_tree_respect_buf_cwd = 1 "0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
let g:nvim_tree_create_in_closed_folder = 1 "0 by default, When creating files, sets the path of a file when cursor is on a closed folder to the parent folder when 0, and inside the folder when 1.
let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } " List of filenames that gets highlighted with NvimTreeSpecialFile
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 0,
    \ 'files': 0,
    \ 'folder_arrows': 0,
    \ }
"If 0, do not show the icons for one of 'git' 'folder' and 'files'
"1 by default, notice that if 'files' is 1, it will only display
"if nvim-web-devicons is installed and on your runtimepath.
"if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
"but this will not work when you set indent_markers (because of UI conflict)

let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'arrow_open': "",
    \   'arrow_closed': "",
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   }
    \ }

nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
" More available functions:
" NvimTreeOpen
" NvimTreeClose
" NvimTreeFocus
" NvimTreeFindFileToggle
" NvimTreeResize
" NvimTreeCollapse
" NvimTreeCollapseKeepBuffers

" }}}
" ASYNCRUN {{{

let g:asyncrun_open = 6
let g:asynctasks_extra_config = ['C:\Users\beren\AppData\Local\nvim\.tasks']

noremap <silent><F5> :AsyncTask file-run<cr>
noremap <silent><f9> :AsyncTask file-build<cr>
noremap <silent><f4> :AsyncStop <cr>

" }}}
" HARPOON {{{

nnoremap <silent> <Leader>ha :lua require("harpoon.mark").add_file()<CR>
nnoremap <silent> <Leader>hh :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <silent> <Leader>1 :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <silent> <Leader>2 :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <silent> <Leader>3 :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <silent> <Leader>4 :lua require("harpoon.ui").nav_file(4)<CR>

" }}}
" MISC {{{

" Clear highlights after search
nnoremap <silent> <esc> :noh<return><esc>

" Fold code blocks
set foldmethod=marker
set foldmarker={{{,}}}

" Line numbers
set number

" Row width == 80 characters
set tw=80

" Tab equalize to 4 spaces
set ts=4
set shiftwidth=4

" Change tabs to spaces
set expandtab

" Mark current line
set cursorline

" Show commands
set showcmd

" Spell checking
set spelllang=en_us,pl
nnoremap <silent> <F10> :set spell!<cr>
inoremap <silent> <F10> <C-O>:set spell!<cr>
" Show nine spell checking candidates at most
set spellsuggest=best,9

" Dynamic menu at screen bottom
set wildmenu

" Match/mark brackets
set showmatch matchtime=3

" }}}
" AUTO COMMANDS {{{

" Remove unnecessary spaces from end of the line
autocmd BufWritePre * %s/\s\+$//e

" Mark text past 80th column
augroup vimrc_over_length
  autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#592929
  autocmd BufEnter * match OverLength /\%81v.*/
augroup END

" Create and load vim sessions
let s:session_loaded = 1

augroup autosession
  " load last session on start
  " Note: without 'nested' filetypes are not restored.
  autocmd VimEnter * nested call s:session_vim_enter()
  autocmd VimLeavePre * call s:session_vim_leave()
augroup END

function! s:session_vim_enter()
    if bufnr('$') == 1 && bufname('%') == '' && !&mod && getline(1, '$') == ['']
        execute 'silent source ~\.vim\lastsession.vim'
    else
      let s:session_loaded = 0
    endif
endfunction

function! s:session_vim_leave()
  if s:session_loaded == 1
    let sessionoptions = &sessionoptions
    try
        set sessionoptions-=options
        set sessionoptions+=tabpages
        execute 'mksession! ~\.vim\lastsession.vim'
    finally
        let &sessionoptions = sessionoptions
    endtry
  endif
endfunction

augroup general
  autocmd!
  " Jump to the position when you last quit
  autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") && &filetype !~# 'commit' |
        \   exe "normal! g'\"" |
        \ endif
  " Automatically equalize splits when Vim is resized
  autocmd VimResized * wincmd =
  " Make it not be overwritten by the default setting of neovim
  autocmd FileType * set formatoptions-=t formatoptions-=o formatoptions-=r textwidth=80
augroup END

" }}}
" COLORSCHEME{{{

" Looks cool with terminal font: 'Caskaydia Cove Nerd Font'
set termguicolors
syntax on
colorscheme nord

" }}}

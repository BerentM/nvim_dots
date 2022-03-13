" Plugs {{{
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

    " snippets
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
	Plug 'jiangmiao/auto-pairs'                 " zamykanie nawiasów
	Plug 'justinmk/vim-sneak'                   " przeskakiwanie do wystąpienia 2 znaków
	Plug 'wellle/targets.vim'                   " rozbudowane zmienianie/ modyfikowanie w nawiasach itp
	Plug 'tpope/vim-surround'                   " domykanie nawiasów itp
	Plug 'tpope/vim-commentary'                 " komentarze
	Plug 'tpope/vim-fugitive'                   " obsługa gita
	Plug 'skywind3000/asynctasks.vim'           " asynchroniczne uruchamianie programów
	Plug 'skywind3000/asyncrun.vim'             " asynchroniczne uruchamianie programów
    Plug 'akinsho/bufferline.nvim'              " spoko wyświetlanie bufferow
    Plug 'lewis6991/gitsigns.nvim'              " wyswietlanie bajerow gita
    Plug 'kyazdani42/nvim-tree.lua'             " drzewko katalogow

    " LOOKS
	Plug 'arcticicestudio/nord-vim'             " nord theme
	Plug 'itchyny/lightline.vim'                " statusline
    Plug 'kyazdani42/nvim-web-devicons'         " kolorowe ikony dla bufferline

call plug#end()
" }}}
" Remaps {{{
" wycinanie, wklejanie, kopiowanie do i z systemowego clipboarda
map <C-x> "+d
map <C-y> "+y
map <C-p> "+p
map <C-P> "+P

" mapowanie <leader> na spacje
let mapleader = " "

" zapisywanie jako root
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" tworzy nową linijke poniżej/powyżej
inoremap jj <C-o>o
inoremap kk <C-o>O

" remap esc na jk
inoremap jk <esc>

" szybkie zapisywanie
nnoremap <silent> <leader>w :w <CR>
"}}}
" Load lua config {{{
lua require("conf")
" }}}
" nvim-tree {{{
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
" AsyncRun {{{
let g:asyncrun_open = 6
let g:asynctasks_extra_config = ['C:\Users\beren\AppData\Local\nvim\.tasks']

noremap <silent><F5> :AsyncTask file-run<cr>
noremap <silent><f9> :AsyncTask file-build<cr>
noremap <silent><f4> :AsyncStop <cr>

" }}}
" Misc {{{
" czyszczenie highlightu po wyszukiwaniu
nnoremap <silent> <esc> :noh<return><esc>

" zawijanie bloków kodu
set foldmethod=marker
set foldmarker={{{,}}}

" numerowanie wierszy
set number

"długość wiesza == 80 znaków
set tw=80

"tab równa się 4 spacjom
set ts=4
set shiftwidth=4

" zamiana tabów na spacje
set expandtab

" oznaczenie aktualnej linii
set cursorline

" wyświetlanie komendy
set showcmd

" sprawdzanie ortografii
" set spell
set spelllang=en_us,pl

" dynamiczne menu u dołu ekranu
set wildmenu

" usuwanie zbędnych spacji z końca linii
autocmd BufWritePre * %s/\s\+$//e

" zakreśla tekst gdy ten jest dłuższy niż 80 znaków
augroup vimrc_over_length
  autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#592929
  autocmd BufEnter * match OverLength /\%81v.*/
augroup END

" matchowanie/oznaczanie nawiasów
set showmatch matchtime=3

"}}}
" Colorscheme{{{
" looks cool with Caskaydia Cove Nerd Font
set termguicolors
syntax on
colorscheme nord
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }
" }}}

" Plugs {{{
call plug#begin(expand('~/.vim/plugged'))
	" telescope
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

	Plug 'arcticicestudio/nord-vim'
	Plug 'itchyny/lightline.vim' " statusline

	Plug 'jiangmiao/auto-pairs' " zamykanie nawiasów
	Plug 'justinmk/vim-sneak' " przeskakiwanie do wystąpienia 2 znaków
	Plug 'wellle/targets.vim' " rozbudowane zmienianie/ modyfikowanie w nawiasach itp

	Plug 'skywind3000/asynctasks.vim' " asynchroniczne uruchamianie programów
	Plug 'skywind3000/asyncrun.vim' " asynchroniczne uruchamianie programów

	" tpope
	Plug 'tpope/vim-surround' " domykanie nawiasów itp
	Plug 'tpope/vim-commentary' " komentarze
	Plug 'tpope/vim-fugitive' " obsługa gita
call plug#end()
" }}}
lua require("conf")
" Remaps {{{
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
" AsyncRun {{{
let g:asyncrun_open = 6
let g:asynctasks_extra_config = ['C:\Users\beren\AppData\Local\nvim\.tasks']

noremap <silent><f5> :AsyncTask file-run<cr>
noremap <silent><f9> :AsyncTask file-build<cr>
noremap <silent><f4> :AsyncStop <cr>

" }}}
" Misc {{{
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
highlight OverLength ctermbg=darkgray ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" matchowanie/oznaczanie nawiasów
set showmatch matchtime=3

"}}}
" Colorscheme{{{
syntax on
colorscheme nord
let g:lightline = {'colorscheme': 'nord',}
" }}}

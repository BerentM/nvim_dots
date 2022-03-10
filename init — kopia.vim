" Plugs {{{
"
call plug#begin(expand('~/.vim/plugged'))
	Plug 'arcticicestudio/nord-vim'
	Plug 'itchyny/lightline.vim' " statusline

	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'skywind3000/asynctasks.vim' " asynchroniczne uruchamianie programów
	Plug 'skywind3000/asyncrun.vim' " asynchroniczne uruchamianie programów

	Plug 'scrooloose/nerdtree'
	Plug 'junegunn/goyo.vim' " maksymalne uproszczenie vima
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fuzzy finder
	Plug 'junegunn/fzf.vim'
	Plug 'antoinemadec/coc-fzf'
	Plug 'fatih/vim-go'

	Plug 'lervag/vimtex'
	Plug 'tweekmonster/gofmt.vim' " gofmt - formatowanie go
	Plug 'jiangmiao/auto-pairs' " zamykanie nawiasów
	Plug 'justinmk/vim-sneak' " przeskakiwanie do wystąpienia 2 znaków
	Plug 'wellle/targets.vim' " rozbudowane zmienianie/ modyfikowanie w nawiasach itp

	Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	Plug 'ryanoasis/vim-devicons'
	Plug 'airblade/vim-gitgutter'


	" tpope
	Plug 'tpope/vim-surround' " domykanie nawiasów itp
	Plug 'tpope/vim-commentary' " komentarze
	Plug 'tpope/vim-fugitive' " obsługa gita

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
nnoremap <leader>i iHello World<esc>
nnoremap <bslash> <space>

" zapisywanie jako root
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" tworzy nową linijke poniżej/powyżej
inoremap jj <C-o>o
inoremap kk <C-o>O

" remap esc na jk
inoremap jk <esc>

" szybkie zapisywanie
nnoremap <silent> <leader>w :w <CR>
" }}}

" Plugin config {{{
" vim-go {{{
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0
" }}}

" NerdTree {{{
map <C-n> :NERDTreeToggle<CR>

" ubijanie NerdTree jeśli jest jedynym okienkiem
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" }}}

" fzf {{{
" Empty value to disable preview window altogether
let g:fzf_preview_window = ''

" Always enable preview window on the right with 60% width
let g:fzf_preview_window = 'right:60%'

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

" Foating window
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.6 } }

" File search keybinding
nnoremap <silent> <leader>g :Files<CR>
" }}}

" AsyncRun {{{
let g:asyncrun_open = 6

noremap <silent><f5> :AsyncTask file-run<cr>
noremap <silent><f9> :AsyncTask file-build<cr>
noremap <silent><f4> :AsyncStop <cr>

" }}}

" Conqueror Of Completion {{{
"
""""""""""""""""""""""""""""""""""""""""""

" TextEdit might fail if hidden is not set.
set hidden

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" coc-snippet {{{
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" " zachowanie jak w VSCode
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? coc#_select_confirm() :
"       \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" let g:coc_snippet_next = '<tab>'
" }}}

" }}}
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

" vimtex
let g:tex_flavor = 'latex'

" matchowanie/oznaczanie nawiasów
set showmatch matchtime=3

"}}}

" Colorscheme{{{

syntax on
colorscheme nord
let g:lightline = {'colorscheme': 'nord',}
" }}}

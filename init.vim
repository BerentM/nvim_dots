" PLUGS & CONFIG {{{

lua << EOF
    require('plugins')      -- packer plugin list
EOF

" Make it easy to load pynvim in each of the virtual envs
if has('win64') || has('win32') || has('win16')
    let g:python3_host_prog = 'C:\Users\beren\scoop\apps\python\current\python.exe'
    " let g:fugitive_git_executable = 'C:\Progra~1\Git\cmd\git.exe'
endif

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
nnoremap <silent> <leader>gg :Neogit<CR>

" Reload gitsigns due to race condition error during start
nnoremap <silent> <leader><leader>g :Gitsigns setup<CR>

" ReSource whole vim
nnoremap <silent> <Leader><Leader>s :source $MYVIMRC<cr>
" Edit init.vim
nnoremap <silent> <Leader><Leader>e :e $MYVIMRC<cr>

"}}}
" VIM-TEST {{{

nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

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
let g:nord_italic = v:false
colorscheme nord

" }}}

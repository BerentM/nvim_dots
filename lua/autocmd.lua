local api = vim.api

-- Remove unnecessary spaces from end of the line
api.nvim_exec([[
    autocmd BufWritePre * %s/\s\+$//e
]], false)

-- Mark text past 80th column
api.nvim_exec([[
    augroup vimrc_over_length
      autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#592929
      autocmd BufEnter * match OverLength /\%81v.*/
    augroup END
]], false)

api.nvim_exec([[
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
]], false)

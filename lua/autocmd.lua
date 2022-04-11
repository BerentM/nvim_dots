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

-- Create and load vim sessions
api.nvim_exec([[
    let s:session_loaded = 1
]], false)

-- load last session on start
-- Note: without 'nested' filetypes are not restored.
api.nvim_exec([[
    augroup autosession
      autocmd VimEnter * nested call s:session_vim_enter()
      autocmd VimLeavePre * call s:session_vim_leave()
    augroup END
]], false)

api.nvim_exec([[
    function! s:session_vim_enter()
        if bufnr('$') == 1 && bufname('%') == '' && !&mod && getline(1, '$') == ['']
            execute 'silent source ~\.vim\lastsession.vim'
        else
          let s:session_loaded = 0
        endif
    endfunction
]], false)

api.nvim_exec([[
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

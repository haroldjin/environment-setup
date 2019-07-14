augroup filetype_action
    autocmd!
    autocmd   filetype   python                    setlocal   foldmethod=indent
    autocmd   filetype   python                    setlocal   foldlevel=99
    autocmd   FileType   python                    set        softtabstop=4       tabstop=4   shiftwidth=4
    autocmd   FileType   ruby,rdoc,cucumber,yaml   set        softtabstop=2       tabstop=2   shiftwidth=2
augroup END

augroup filetype_set
    autocmd!
    autocmd   BufNewFile,BufRead   *.jade        setlocal      ft=jade
    autocmd   BufNewFile,BufRead   *.less        setlocal      ft=less
    autocmd   BufNewFile,BufRead   *.md          setlocal      ft=markdown
    autocmd   BufNewFile,BufRead   *.twig        setlocal      ft=html
    autocmd   BufNewFile,BufRead   Gemfile       setfiletype   ruby
    autocmd   BufNewFile,BufRead   Isolate       setfiletype   ruby
    autocmd   BufNewFile,BufRead   Vagrantfile   setfiletype   ruby
    autocmd   BufNewFile,BufRead   config.ru     setfiletype   ruby
augroup END

augroup QFixToggle
    autocmd!
    autocmd   BufWinEnter   quickfix   let   g:qfix_win             =    bufnr("$")
    autocmd   BufWinLeave   *          if    exists("g:qfix_win")   &&   expand("<abuf>")   ==   g:qfix_win   |   unlet!   g:qfix_win   |   endif
augroup END

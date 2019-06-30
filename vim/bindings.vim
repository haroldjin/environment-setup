" Key & Plugin Mappings {{{1
" set completefunc=syntaxcomplete#Complete
" {{{2 Global
"}}}
" {{{2 Tab Buf Win
" Tmux mapping
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nnoremap <silent><leader>tc :tabclose<CR>
nnoremap <silent><leader>tn :tabnext<CR>
nnoremap <silent><leader>tp :tabprevious<CR>
nnoremap <silent><leader>tt :tabnew<CR>
nnoremap <silent><leader>wh :exe "vertical resize " . (winwidth(0) * 2/3)<CR>
nnoremap <silent><leader>wj :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent><leader>wk :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent><leader>wl :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
noremap <silent><leader>bc :bd<CR>
noremap <silent><leader>bn :bn<CR>
noremap <silent><leader>bp :bp<CR>
"}}}
" {{{2 Editor
nmap <silent><Leader>rv :e $MYVIMRC<CR>
nmap <silent><Leader>sv :so $MYVIMRC<CR>
nmap <silent><leader>/ :nohlsearch<CR>
nmap <silent><leader>f [s1z=<c-o>
nmap <silent><leader>sa ggVG
nmap <silent><leader>sb :buffers<cr>
nmap <silent><leader>sr :reg<cr>
nnoremap <leader>x :update<CR>
nnoremap <space> za
noremap <Leader>E :qa!<CR>
noremap <Leader>e :quit<CR>
vmap <S-Tab> <gv
vmap <Tab> >gv
vnoremap <silent><Leader>s :sort<CR>
inoremap <c-c> <esc>:write<cr>
inoremap jk <esc>:update<cr>
" do not save replaced text in reg when pasting
xnoremap p pgvy
"}}}
" {{{2 Bash Simulation
inoremap <C-f> <C-o>a
inoremap <C-b> <C-o>h
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>0
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-u> <C-o>d0<C-o>dl
inoremap <C-w> <C-o>dB<C-o>x
"}}}
" {{{2 Utils
" Sat May  5 15:01:23 2018
nnoremap <leader>ut "=strftime("%c")<CR>P
inoremap <leader>ut <C-R>=strftime("%c")<CR>
map <leader>uW :w !sudo tee % >/dev/null<CR>
nnoremap <leader>ud :exe ":!clear;sdcv ". expand("<cword>")<cr>
"}}}
" {{{2 Toggles
nnoremap <leader>Tp :set paste!<cr>
nnoremap <leader>Ts :set spell!<cr>
" }}}
" {{{2 Google
nnoremap <leader>Gd :exe ":Google define ". expand("<cword>")<cr>
nnoremap <leader>Go :Google<cr>
nnoremap <leader>Gu :call HandleURL()<cr><cr>
"}}}
" {{{2 Ack
let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack
" }}}
" {{{2 vim-session
let g:session_autosave = 'no'
" }}}
" {{{2 Git
nnoremap <leader>ga :Git add % :p<CR><CR>
nnoremap <leader>gA :Git add . <CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>gt :Gcommit -v -q %:p<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR><CR>
nnoremap <leader>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <leader>gp :Ggrep<Space>
nnoremap <leader>gm :Gmove<Space>
nnoremap <leader>gb :Git branch<Space>
nnoremap <leader>go :Git checkout<Space>
"}}}
" {{{2 Common Plugins
nmap <leader>z :NERDTreeToggle<CR>
nmap <silent><leader>a :TagbarToggle<CR>
nmap <silent><leader><space> :FixWhitespace<CR>
"}}}
" {{{2 Quick Fix
nnoremap <silent><leader>q :QFix<cr>
nnoremap <leader>} :lnext<cr>
nnoremap <leader>{ :lprev<cr>
"}}}
" {{{2 Common Command Reword
cnoreabbrev Q q
cnoreabbrev Q! q!
cnoreabbrev Qall qall
cnoreabbrev Qall! qall!
cnoreabbrev W w
cnoreabbrev W! w!
cnoreabbrev WQ wq
cnoreabbrev Wa wa
cnoreabbrev Wq wq
cnoreabbrev wQ wq
"}}}
"}}}
" Plugin Config{{{1
" {{{ ALE
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

set statusline=%{LinterStatus()}
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
" }}}
" {{{ multi-cursor
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<C-[>'
" }}}
"{{{2 vim-airline
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
if !exists('g:airline_powerline_fonts')
    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline#extensions#tabline#left_alt_sep = '|'
else
    let g:airline#extensions#tabline#left_sep = ''
    let g:airline#extensions#tabline#left_alt_sep = ''
    " powerline symbols
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = ''
endif
" }}}
"{{{2 NERDTree configuration
" let g:NERDTreeDirArrows = 1
" let g:NERDTreeDirArrowExpandable = '▸'
" let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__', 'node_modules']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeWinSize = 30
"}}}
"{{{2 ctrlp.vim
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$|vendor\|\.hg$\|\.svn$\|\.yardoc\|public\/images\|public\/system\|data\|log\|tmp\|node_modules$',
  \ 'file': '\.exe$\|\.so$\|\.dat$'
  \ }
cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
" noremap <leader>b :CtrlPBuffer<CR>
" let g:ctrlp_map = '<leader>p'
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_use_caching = 0
let g:ctrlp_show_hidden = 1
"}}}
" {{{2 Super Tab
" let g:SuperTabDefaultCompletionType = "<c-n>"
" let g:SuperTabContextDefaultCompletionType = "<c-n>"
"}}}
" {{{2 Fuf
" nnoremap <silent><leader>f.  :FufFileWithCurrentBufferDir<cr>
" nnoremap <silent><leader>f/  :FufFile /<cr>
" nnoremap <silent><leader>fb  :FufBuffer<cr>
" nnoremap <silent><leader>fd  :FufFile $HOME/Dropbox/<cr>
" nnoremap <silent><leader>ff  :FufFile<cr>
" nnoremap <silent><leader>fh  :FufFile $HOME/<cr>
" nnoremap <silent><leader>fm :FufBookmarkDir<cr>
" nnoremap <silent><leader>ft  FufTag<cr>
"}}}
" {{{2 Vim-note behaviors
let g:notes_tab_indents = 1
let g:notes_directories = ['~/Dropbox/8. Notes/']
let g:notes_conceal_bold = 0
"}}}
" {{{2 YCM
let g:ycm_autoclose_preview_window_after_completion = 1
nnoremap <leader>yg :YcmCompleter GoTo<CR>
nnoremap <leader>ygd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>ygD :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>ygr :YcmCompleter GoToReferences<CR>
" }}}
" Augroup Actions {{{1

augroup filetype_action
    autocmd!
    autocmd BufEnter * set mouse=a
    autocmd filetype python setlocal foldmethod=indent
    autocmd filetype python setlocal foldlevel=99
    " autocmd filetype python setlocal keywordprg=pydoc
    " autocmd filetype python setlocal keywordprg=pydoc3
    autocmd FileType ruby,rdoc,cucumber,yaml set softtabstop=2 tabstop=2 shiftwidth=2
augroup END

augroup filetype_set
    autocmd!
    autocmd BufNewFile,BufRead *.jade setlocal ft=jade
    autocmd BufNewFile,BufRead *.less setlocal ft=less
    autocmd BufNewFile,BufRead *.md setlocal ft=markdown
    autocmd BufNewFile,BufRead *.twig setlocal ft=html
    autocmd BufNewFile,BufRead Gemfile     setfiletype ruby
    autocmd BufNewFile,BufRead Isolate     setfiletype ruby
    autocmd BufNewFile,BufRead Vagrantfile setfiletype ruby
    autocmd BufNewFile,BufRead config.ru   setfiletype ruby
augroup END

" F Commands {{{1
" F1 Help normal & insert mode
map <F1> "zyiw:exe "h ".@z.""<CR>

" F2 Stackoverflow
vnoremap <F2> :call stackoverflow#StackOverflow(GetSelectedText())<cr>

" Redraw screen
nnoremap <silent><F5> :redraw!<CR>

" F9 Filetype Group
nnoremap <F9> :Dispatch<CR>
"}}}
" F Commands Augroup {{{1
" F8 Filetype Group
augroup filetype_execute
    autocmd!
    autocmd filetype c nnoremap <buffer> <F8> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
    autocmd filetype cpp nnoremap <buffer> <F8> :w <bar> exec '!g++ -std=c++11 '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
    autocmd filetype python nnoremap <buffer> <F8> :w <bar> exec '!python '.shellescape('%')<CR>
    " autocmd filetype python nnoremap <buffer> <F8> :w <bar> exec '!python3 '.shellescape('%')<CR>
    autocmd filetype ruby nnoremap <buffer> <F8> :w <bar> exec '!ruby '.shellescape('%')<CR>
    autocmd filetype sh nnoremap <buffer> <F8> :w <bar> exec '!bash '.shellescape('%')<CR>
    autocmd filetype perl nnoremap <buffer> <F8> :w <bar> exec '!perl '.shellescape('%')<CR>
augroup END

" F9 dispatch
augroup dispatch_action
    autocmd!
    autocmd FileType ruby let b:dispatch = 'ruby %'
    autocmd FileType perl let b:dispatch = 'perl %'
    autocmd FileType sh let b:dispatch = 'sh %'
    autocmd FileType c let b:dispatch = 'gcc %'
    autocmd FileType cpp let b:dispatch = 'g++ -std=c++11 %'
    autocmd FileType javascript let b:dispatch = 'nodemon %'
    autocmd FileType python let b:dispatch = 'python %'
augroup END

" }}}
" {{{1 Augroup
augroup QFixToggle
 autocmd!
 autocmd BufWinEnter quickfix let g:qfix_win = bufnr("$")
 autocmd BufWinLeave * if exists("g:qfix_win") && expand("<abuf>") == g:qfix_win | unlet! g:qfix_win | endif
augroup END
"}}}
" Util Commands & Funcs {{{1

" toggles the quickfix window.
let g:jah_Quickfix_Win_Height=10
command! -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
  if exists("g:qfix_win") && a:forced == 0
    cclose
  else
    execute "copen " . g:jah_Quickfix_Win_Height
  endif
endfunction

" tab space util
command! -nargs=* Tab call Tab()
fu! Tab()
    let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
    if l:tabstop > 0
        let &l:sts = l:tabstop
        let &l:ts = l:tabstop
        let &l:sw = l:tabstop
    endif
    call SummarizeTab()
endfu

function! SummarizeTab()
    try
        echohl ModeMsg
        echon "\ntabstop=".&l:ts
        echon "\nshiftwidth=".&l:sw
        echon "\nsofttabstop=".&l:sts
        echon "\n"
        if &l:et
            echon 'expandtab'
        else
            echon 'noexpandtab'
        endif
    finally
        echohl None
    endtry
endfu

fu! InsertSemiColon()
    execute "normal! mqA;\<esc>`q"
endfu

" Local
fu! GetSelectedText()
    normal gv"xy
    " normal "xy
    let result = getreg("x")
    normal gv
    return result
endfu

" Web
fu! HandleURL()
    let l:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;]*')
    if l:uri != ""
        exec "!open '".l:uri."'"
    else
        echo "No URI found in line."
    endif
endfu

" Vi Help
fu! Help()
  if &buftype=="help" && match( strpart( getline("."), col(".")-1,1), "\\S")<0
    bw
  else
    try
      exec "help ".expand("<cWORD>")
    catch /:E149:\|:E661:/
      " E149 no help for <subject>
      " E661 no <language> help for <subject>
      echon "Command not found: ".expand("<cWORD>")
      " exec "help ".expand("<cword>")
    endtry
  endif
endfu
" }}}
" {{{3 functions
function! BackgroundCommandClose(channel)
  " Read the output from the command into the quickfix window
  execute "cfile! " . g:backgroundCommandOutput
  " Open the quickfix window
  copen
  unlet g:backgroundCommandOutput
endfunction

function! RunBackgroundCommand(command)
  " Make sure we're running VIM version 8 or higher.
  if v:version < 800
    echoerr 'RunBackgroundCommand requires VIM version 8 or higher'
    return
  endif

  if exists('g:backgroundCommandOutput')
    echo 'Already running task in background'
  else
    echo 'Running task in background'
    " Launch the job.
    " Notice that we're only capturing out, and not err here. This is because, for some reason, the callback
    " will not actually get hit if we write err out to the same file. Not sure if I'm doing this wrong or?
    let g:backgroundCommandOutput = tempname()
    call job_start(a:command, {'close_cb': 'BackgroundCommandClose', 'out_io': 'file', 'out_name': g:backgroundCommandOutput})
  endif
endfunction

command! -nargs=+ -complete=shellcmd RunBackgroundCommand call RunBackgroundCommand(<q-args>)
" }}}

" {{{ Abbreviation
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
cnoreabbrev ag Ack
cnoreabbrev Ag Ack
"}}}
" {{{ Global Editor Mapping
" quick fix
nnoremap <silent><leader>q :QFix<cr>
nnoremap <leader>} :lnext<cr>
nnoremap <leader>{ :lprev<cr>

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

nnoremap <leader>Tp :set paste!<cr>
nnoremap <leader>Ts :set spell!<cr>

" Insert mode bash emulation
inoremap <C-f> <C-o>a
inoremap <C-b> <C-o>h
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>0
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-u> <C-o>d0<C-o>dl
inoremap <C-w> <C-o>dB<C-o>x

"}}}
" {{{ Global
nmap <silent><leader><space> :FixWhitespace<CR>
nmap <leader>z :NERDTreeToggle<CR>
nmap <silent><leader>a :TagbarToggle<CR>
" }}}
" {{{ Common Binding

" Easy motion
nmap <leader>ces <Plug>(easymotion-overwin-f2)
map <Leader>cej <Plug>(easymotion-j)
map <Leader>cek <Plug>(easymotion-k)

" Git integration
nnoremap <leader>cga :Git add % :p<CR><CR>
nnoremap <leader>cgA :Git add . <CR><CR>
nnoremap <leader>cgs :Gstatus<CR>
nnoremap <leader>cgc :Gcommit -v -q<CR>
nnoremap <leader>cgt :Gcommit -v -q %:p<CR>
nnoremap <leader>cgd :Gdiff HEAD<CR>
nnoremap <leader>cge :Gedit<CR>
nnoremap <leader>cgr :Gread<CR>
nnoremap <leader>cgw :Gwrite<CR><CR>
nnoremap <leader>cgl :silent! Glog<CR>:bot copen<CR>
nnoremap <leader>cgp :Ggrep<Space>
nnoremap <leader>cgm :Gmove<Space>
nnoremap <leader>cgb :Git branch<Space>
nnoremap <leader>cgco :Git checkout<Space>

" YCM
nnoremap <leader>yg :YcmCompleter GoTo<CR>
nnoremap <leader>ygd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>ygdc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>ygr :YcmCompleter GoToReferences<CR>


"}}}
" {{{ Miscellaneous Binding
" Tabularize
if exists(":Tabularize")
    nmap <leader>mt= :Tabularize /=<CR>
    vmap <leader>mt= :Tabularize /=<CR>
    nmap <leader>mt: :Tabularize /:\zs<CR>
    vmap <leader>mt: :Tabularize /:\zs<CR>
    nmap <leader>mt" :Tabularize /"<CR>
    vmap <leader>mt" :Tabularize /"<CR>
endif

"vim test
nmap <silent> <leader>mt<C-n> :TestNearest<CR>
nmap <silent> <leader>mt<C-f> :TestFile<CR>
nmap <silent> <leader>mt<C-s> :TestSuite<CR>
nmap <silent> <leader>mt<C-l> :TestLast<CR>
nmap <silent> <leader>mt<C-g> :TestVisit<CR>

" }}}
" {{{ Utility Binding
nnoremap <leader>ut "=strftime("%c")<CR>P
inoremap <leader>ut <C-R>=strftime("%c")<CR>
nnoremap <leader>ud :exe ":!clear;sdcv ". expand("<cword>")<cr>
map <leader>uW :w !sudo tee % >/dev/null<CR>

" Google search, define and goto url
nnoremap <leader>ugo :Google<cr>
nnoremap <leader>ugd :exe ":Google define ". expand("<cword>")<cr>
nnoremap <leader>ugu :call HandleURL()<cr><cr>
" }}}
" {{{ Function Keys
" F1 - Help on word under cursor. Yank inner word into register z and run help
" on it on that register both in normal and insert mode
map <F1> "zyiw:exe "h ".@z.""<CR>

" F2 - Dispatch commands to run against the current file and show result in a
" quickfix window
nnoremap <F2> :Dispatch<CR>

" F3 - Selects the text and runs stackoverflow query and put the result in the
" quickfix window. Type ,q for quickfix window
vnoremap <F3> :call stackoverflow#StackOverflow(GetSelectedText())<cr>

" Redraw screen
nnoremap <silent><F5> :redraw!<CR>
" }}}

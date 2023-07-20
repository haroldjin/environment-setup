" Plugin Setup {{{1
set nocp        " set Vi-incompatible
filetype off    " Don't detect file type.

"----------------------------------------------------------- Plugin Start
set rtp+=~/.vim/bundle/Vundle.vim   " A list of directories searched for runtime files
call vundle#begin()                 " Start Vundle
Plugin 'gmarik/Vundle.vim'
Plugin 'airblade/vim-gitgutter'          " Provides nice gutter for file addition in git control
Plugin 'easymotion/vim-easymotion'       " Allows search with ,ces or ,ce{l|k}
Plugin 'fatih/vim-go'                    " Go development inside vim. :GoBuild, GoTest, GoDef, GoCoverage, etc..
Plugin 'godlygeek/tabular'               " Allow tabularize data
Plugin 'haroldjin/vim-essentials'        " Essential tools for everyday vimer
Plugin 'honza/vim-snippets'              " Snippet autocompletes data for you, customizable
Plugin 'janko/vim-test'                  " A Vim wrapper for running tests on different granularities.
Plugin 'kien/ctrlp.vim'                  " File Search many places with c-f and c-b to search buffers, files, mru, etc.
Plugin 'kshenoy/vim-signature'           " place, toggle and display marks. m[0-9] will print the marks
Plugin 'majutsushi/tagbar'               " Allow display of tags, - oasf0 [0-9]
Plugin 'mileszs/ack.vim'                 " :Ack [options] {pattern} [{directories}]
Plugin 'plasticboy/vim-markdown'         " Syntax highlighting, matching rules and mappings for the original Markdown and extensions.
Plugin 'scrooloose/nerdtree'             " Display tree for filesystem
Plugin 'tmhedberg/matchit'               " Better matching for key '%'
Plugin 'tpope/vim-commentary'            " Comment with gcc. :g/content/Commentary ;; 7,17Commentary
Plugin 'tpope/vim-dispatch'              " :Dispatch commands to run in background
Plugin 'tpope/vim-fugitive'              " map ,g to find out more about git mapping in vim
Plugin 'tpope/vim-repeat'                " Use . command to repeat vim surround
Plugin 'tpope/vim-surround'              " Powerful cs, ds, ys (creates new surround), viS', works with vim-repeat
Plugin 'vim-airline/vim-airline'         " Status bar display more info
Plugin 'vim-airline/vim-airline-themes'  " Theme for airline
Plugin 'w0rp/ale'                        " Async Completion Engine running in the background for Python, C++, etc..

call vundle#end()
filetype plugin indent on
syntax on
" }}}
" {{{ ALE
" Bottom statusline display
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_list_window_size = 5

" ALE completion, fix errors when save
let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1

" Run linter every 2 seconds
let g:ale_lint_delay = 2000

" Open quickfix when error occurs
let g:ale_open_list = 1
" }}}
" {{{ vim-airline
" Configure it to be more performant and only load necessary extensions
let g:airline_extensions = ["ale", "tabline", "branch"]
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1 "Integrate with ALE
let g:airline_highlighting_cache = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline#extensions#tabline#left_alt_sep = '|'
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'
" }}}
" {{{ vim-airline-themes
let g:airline_theme='ouo'
" }}}
" {{{ NERDTree configuration
" let g:NERDTreeDirArrows = 1
" let g:NERDTreeDirArrowExpandable = '▸'
" let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__', 'node_modules']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeWinSize = 30
"}}}
" {{{ ctrlp.vim
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
let g:ctrlp_working_path_mode = 0
"}}}
" {{{ easy-motion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1
" }}}
" {{{ ACK
let g:ackprg = 'ag --vimgrep --smart-case'
" }}}
" {{{ YCM
let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_filetype_specific_completion_to_disable = { 'vim':1, 'txt':1 }
" }}}
" {{{ Dispatch
augroup dispatch_action
    autocmd!
    autocmd FileType ruby let b:dispatch = 'ruby %'
    autocmd FileType perl let b:dispatch = 'perl %'
    autocmd FileType sh let b:dispatch = 'sh %'
    autocmd FileType c let b:dispatch = 'gcc %'
    autocmd FileType cpp let b:dispatch = 'g++ -std=c++11 %'
    autocmd FileType javascript let b:dispatch = 'nodemon %'
    autocmd FileType python let b:dispatch = 'python3 %'
augroup END
" }}}
" {{{ vim-test
let test#strategy = "dispatch"
let test#python#runner = 'pytest'
" }}}
" {{{ vim-essentials
let g:essentials_remove_whitespace_ignore_filetypes = ['text']
" }}}

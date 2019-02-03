" Basic Settings {{{1
let mapleader = ","

" {{{Editor
colorscheme wombat256mod
set cursorline
let &backspace="indent,eol,start"  " Fix backspace deletion
let &clipboard = has('unnamedplus') ? 'unnamedplus' : 'unnamed' " Check have clipboard
" }}}

" General Configuration
set foldmethod=marker   " set fold to mark
set number
set history=700
set undolevels=700          " Max num of undo step

" Editor Configuration
set ruler               "Display cursor position
set scrolloff=1         "always show 1 lines before/after the cursor
set shiftround          "fill gap
set shiftwidth=4        "overrides tabstop
set showcmd     "Show partial command in the last line of the screen
set smartcase   "When capital letter is used then it will search only capital else all
set smartindent             " smarter indent for C-like languages
set softtabstop=4           " An addition to tabstop for tab in editing
set tabstop=4               " number of spaces a <tab> counts for
set tags=./tags,tags;$HOME  " For ctag with completion
set ttyfast                 " Set fast tty for redrawing.
set viminfo='100,f1         " Only marks will be saved in viminfo
set spell spelllang=en_us
setlocal spell spelllang=en_us
" set cryptmethod'=blowfish2

" Event Configuration
set autoread                    " Read the file automatically if changed outside the buffer
set autowriteall
set ffs=unix,dos,mac    " set file format
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite,*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
set wildmenu                            "allows menu to be tabbed.
set wildmode=list:longest,list:full     " Complete all matche till longest commonn string

" Behavior Configuration
set autoindent                  " returns to indent of previous line
set copyindent          " copy the previous indentation on autoindenting
set encoding=utf-8
set expandtab           " spaces for tab <c-v><tab> if want realtab
set fileencoding=utf-8  " Saving file format
set fileencodings=utf-8 " Options when saving a file
set fileformats=unix,dos,mac " Set EOL accordingly
set hidden                  " No need to save before switching buffers
set hlsearch                " highlights the search
set ignorecase              " Better searching
set incsearch
set lazyredraw              " Screen not updated for macro, redraw force it
set nobackup                " No backup file
set noequalalways           " windows not set equal
set nojoinspaces
set noswapfile              " buffer loaded without swp file
set nowritebackup           " No backup on write a file
set nrformats=          "Treat 001 as digit when using c-a or c-x on normal mode

set viminfo='0,:0,<0,@0,f0
"'0 means that marks will not be saved
":0 means that command-line history will not be saved
"<0 means that registers will not be saved
"@0 means that input-line history will not be saved
"f0 means that marks will not be saved
"no % means that the buffer list will not be saved
"no / means that the search history will be saved
"   

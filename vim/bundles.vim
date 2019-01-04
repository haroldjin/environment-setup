" Plugin Setup {{{1
set nocp        " set Vi-incompatible
filetype off    " Don't detect file type.

"----------------------------------------------------------- Plugin Start
set rtp+=~/.vim/bundle/Vundle.vim   " A list of directories searched for runtime files
call vundle#begin()                 " Start Vundle

" MAIN MANAGER
Plugin 'gmarik/Vundle.vim'

" Notes
Plugin 'plasticboy/vim-markdown'
Plugin 'xolox/vim-notes'  " For taking better notes
Plugin 'xolox/vim-misc'   " extended vimscript library
Plugin 'vim-scripts/L9'   " vimscript library for vim note

" Async and session
Plugin 'tpope/vim-dispatch'    " dispatch background jobs
Plugin 'xolox/vim-session'     " Saves session

" REPEAT
Plugin 'tpope/vim-repeat'      " Use . command to repeat
Plugin 'tpope/vim-surround'    " Powerful cs, ds, ys, viS', works with vim-repeat

" DEV Tools
Plugin 'tpope/vim-commentary'  " Comment with gcc. :g/content/Commentary ;; 7,17Commentary
Plugin 'jiangmiao/auto-pairs'      " Pair quotes, brackets, etcs
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/syntastic'

" DISPLAY
Plugin 'airblade/vim-gitgutter'         " Provides nice gutter for file addition in git control
Plugin 'haroldjin/vim-stackoverflow'  " Stack Overflow search
Plugin 'kien/ctrlp.vim'                 " File Search
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdtree'            " Display tree for filesystem
Plugin 'haroldjin/vim-g'                      " Search Google

" Editor
" Plugin 'Yggdroot/indentLine'
Plugin 'bronson/vim-trailing-whitespace'  " Whitespace cleaner useful
Plugin 'kshenoy/vim-signature'
Plugin 'tmhedberg/matchit'                " Better matching for key '%'
Plugin 'tpope/vim-fugitive'               " plugin on GitHub repo
Plugin 'vim-airline/vim-airline'          " Status bar display more info

call vundle#end()
filetype plugin indent on
syntax on

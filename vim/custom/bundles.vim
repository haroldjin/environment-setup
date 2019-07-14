" Plugin Setup {{{1
set nocp        " set Vi-incompatible
filetype off    " Don't detect file type.

"----------------------------------------------------------- Plugin Start
set rtp+=~/.vim/bundle/Vundle.vim   " A list of directories searched for runtime files
call vundle#begin()                 " Start Vundle
Plugin 'gmarik/Vundle.vim'

" Plugin 'Shougo/deoplete.nvim'
Plugin 'easymotion/vim-easymotion'       " Allows search with ,ces or ,ce{l|k}
Plugin 'Valloric/YouCompleteMe'          " Syntax completion
Plugin 'airblade/vim-gitgutter'          " Provides nice gutter for file addition in git control
Plugin 'bronson/vim-trailing-whitespace' " Whitespace cleaner useful
Plugin 'fatih/vim-go'                    " Go development inside vim. :GoBuild, GoTest, GoDef, GoCoverage, etc..
Plugin 'godlygeek/tabular'               " Allow tabularize data
Plugin 'haroldjin/vim-g'                 " Search Google
Plugin 'haroldjin/vim-stackoverflow'     " Stack Overflow search
Plugin 'SirVer/ultisnips'                " Autocompletes snippets for you
Plugin 'honza/vim-snippets'              " Snippet autocompletes data for you, customizable
Plugin 'kien/ctrlp.vim'                  " File Search many places with c-f and c-b to search buffers, files, mru, etc.
Plugin 'kshenoy/vim-signature'           " place, toggle and display marks. m[0-9] will print the marks
Plugin 'majutsushi/tagbar'               " Allow display of tags, - oasf0 [0-9]
Plugin 'mileszs/ack.vim'                 " :Ack [options] {pattern} [{directories}]
Plugin 'scrooloose/nerdtree'             " Display tree for filesystem
Plugin 'terryma/vim-multiple-cursors'    " Having multiple cursors to select windows
Plugin 'tmhedberg/matchit'               " Better matching for key '%'
Plugin 'tpope/vim-commentary'            " Comment with gcc. :g/content/Commentary ;; 7,17Commentary
Plugin 'tpope/vim-dispatch'              " :Dispatch commands to run in background
Plugin 'tpope/vim-fugitive'              " map ,g to find out more about git mapping in vim
Plugin 'tpope/vim-repeat'                " Use . command to repeat vim surround
Plugin 'tpope/vim-surround'              " Powerful cs, ds, ys (creates new surround), viS', works with vim-repeat
Plugin 'vim-airline/vim-airline'         " Status bar display more info
Plugin 'w0rp/ale'                        " Async Completion Engine running in the background for Python, C++, etc..

call vundle#end()
filetype plugin indent on
syntax on


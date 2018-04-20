if &compatible
    set nocompatible
endif

set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein'))

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/vimproc.vim')
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snippets')

call dein#add('ujihisa/unite-colorscheme')

call dein#add('Townk/vim-autoclose')

call dein#add('Yggdroot/indentLine')

call dein#add('twitvim/twitvim')

"Go plugin 
call dein#add('fatih/vim-go')
"Toml syntax
call dein#add('cespare/vim-toml')

"colorscheme
call dein#add('tomasr/molokai')
call dein#add('nanotech/jellybeans.vim')

"Language Server
call dein#add('natebosch/vim-lsc')
call dein#end()

filetype plugin indent on

if dein#check_install()
    call dein#install()
endif

syntax enable

colorscheme jellybeans
set tabstop=4
set number
set autoindent
set title
set expandtab
set shiftwidth=4
set expandtab
set softtabstop=4
set smartindent
set whichwrap=b,s,[,],,~
set backspace=indent,eol,start
set pumheight=10 
set showmatch
set matchtime=1
set smartcase
set ignorecase
set wrapscan
set confirm
set nobackup
set noswapfile
set nocompatible
set clipboard+=unnamed 

"key mapping
noremap <Right> <Nop>
noremap <Left> <Nop>
noremap <Up> <Nop>
noremap <Down> <Nop>

"configuration for vim-go
let g:go_highlight_function = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1 

"configuration for twitvim
let twitcim_enable_python = 1

"vim-lsc configuration
let g:lsc_server_commands = {
    \ 'go': 'go-langserver -gocodecompletion -mode stdio',
    \ 'python': 'pyls',
    \}
let g:lsc_auto_map = v:true


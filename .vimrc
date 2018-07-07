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
set tabstop=4       "タブ幅を4に設定する
set number          "行番号の表示
set autoindent      "改行時に前のインデントを持続させる
set title           "タイトルの表示
set expandtab       "タブを空白文字に設定する
set shiftwidth=4    "インデント幅を設定する。autoindenのときにこれが反映される
set softtabstop=4   "キーボードでtabを挿入した際のタブ幅の設定
set smartindent     "改行時に入力された行の末尾に合わせて次のインデントを増減する
set whichwrap=b,s,h,l,<,>,[,],~ "行をまたいで移動
set backspace=indent,eol,start "挿入モードでバックスペースで削除できるようにする
set pumheight=10    "変換候補で一度に表示される数を設定する
set showmatch       "対応するカッコをハイライトする
set smartcase       "検索時に小文字なら大文字無視、大文字なら無視しない設定
set ignorecase      "検索で大文字小文字を区別しない
set wrapscan        "検索をファイル末尾まで行ったらファイルの先頭に移動
set confirm         "ファイル保存を確認するファイアログを表示する
set nobackup        "バックアップファイルを作成しない
set noswapfile      "スワップファイルを作成しない
set clipboard+=unnamed "クリップボードの動作設定

autocmd BufNewFile,BufRead *.{html,htm,vue*} set filetype=html

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


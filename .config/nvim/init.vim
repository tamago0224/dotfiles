if &compatible
    set nocompatible
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')
    call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
    call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})
    call dein#end()
    call dein#save_state()
endif

if dein#check_install()
    call dein#install()
endif

filetype plugin indent on
syntax on


colorscheme molokai
set tabstop=4 "タブ幅を4に設定する
set autoindent "改行時に前のインデントを持続させる
set title "タイトルの表示
set expandtab "タブを空白文字に設定する
set shiftwidth=4 "インデント幅を設定する。autoindenのときにこれが反映される
set softtabstop=4 "キーボードでtabを挿入した際のタブ幅の設定
set smartindent "改行時に入力された行の末尾に合わせて次のインデントを増減する
set whichwrap=b,s,h,l,<,>,[,],~ "行をまたいで移動
set backspace=indent,eol,start "挿入モードでバックスペースで削除できるようにする
set pumheight=10 "変換候補で一度に表示される数を設定する
set showmatch "対応するカッコをハイライトする
set smartcase "検索時に小文字なら大文字無視、大文字なら無視しない設定
set ignorecase "検索で大文字小文字を区別しない
set wrapscan "検索をファイル末尾まで行ったらファイルの先頭に移動
set confirm "ファイル保存を確認するファイアログを表示する
set nobackup "バックアップファイルを作成しない
set noswapfile "スワップファイルを作成しない
set hlsearch "検索時、候補をハイライトする
set clipboard+=unnamed "クリップボードの動作設定
set statusline=%m
set statusline+=%=
set statusline+=[enc=%{&fileencoding}]
set statusline+=[line=%l/%L]
set statusline+=[filepath=%F]
set statusline+=%=
"set statusline+=%{fugitive#statusline()} " Gitブランチ名を表示する
set laststatus=2

autocmd BufRead,BufNewFile *.md,*.yml,*.j2 setlocal tabstop=2 softtabstop=2 shiftwidth=2


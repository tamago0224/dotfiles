if &compatible
    set nocompatible
endif

" deinの自動インストール
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
    call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif

let &runtimepath = s:dein_repo_dir . "," . &runtimepath
" プラグインの読み込み
let s:toml_file = $HOME . '/.config/nvim/dein.toml'
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)
    call dein#load_toml(s:toml_file)
    call dein#end()
    call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
    call dein#install()
endif

syntax enable

set tabstop=4       "タブ幅を4に設定する
" set number          "行番号の表示
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
" status line
set statusline+=%r
set statusline+=%h
set statusline+=%w
"set statusline+=%=
set statusline+=[enc=%{$fileencoding}]
set statusline+=[line=%l/%L]
set laststatus=2
set encoding=utf-8

autocmd BufNewFile,BufRead *.{html,htm,vue*} set filetype=html
autocmd BufNewFile,BufRead *.{yaml,yml} set set shiftwidth=2 softtabstop=2 tabstop=2

"key mapping
noremap <Right> <Nop>
noremap <Left> <Nop>
noremap <Up> <Nop>
noremap <Down> <Nop>
imap <Nul> <Nop>

" configuration for deoplete
let g:deoplete#enable_at_startup = 1
" configuration for neosnippet
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory=' ~/.vim/dein/repos/github.com/Shougo/neosnippet-snippets/neosnippets,~/.vim/snippets'

"configuration for twitvim
let twitcim_enable_python = 1

autocmd User LSCShowPreview wincmd H | vertical resize 0

" markdown
let g:previm_open_cmd='firefox'
let g:vim_markdown_folding_disabled  = 1
nnoremap <slient><c-p> :PrevimOpen<CR>
augroup PreVimSettings
    autocmd!
    autocmd BufNewFile, BufRead *.{md, mdwn, mkd, mkdn, mark*} set filetype=markdown
augroup END
inoremap <C-CR> <Space><Space><CR>

"rainbow setting
let g:rainbow_active = 1
"vim-matchup setting
let g:loaded_matchit = 1

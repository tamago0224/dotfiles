if &compatible
    set nocompatible
endif

" Plug settings
call plug#begin('~/.vim/plugged')

" utilities
Plug 'Townk/vim-autoclose'
Plug 'luochen1990/rainbow'
Plug 'vim-jp/vimdoc-ja'

" vim-lsp and settings
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

" explore 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'lambdalisue/fern.vim'

" color scheme
Plug 'tomasr/molokai'
Plug 'nanotech/jellybeans.vim'

" golang
Plug 'mattn/vim-goimports'

" python
Plug 'Vimjas/vim-python-pep8-indent'

" templates
Plug 'mattn/vim-sonictemplate'

call plug#end()

syntax enable

"colorscheme jellybeans
colorscheme molokai
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
set imdisable
" leader key configuration
let g:mapleader = "\<Space>"

autocmd BufNewFile,BufRead *.{html,htm,vue*} set filetype=html
autocmd BufNewFile,BufRead *.{yaml,yml} set shiftwidth=2 softtabstop=2 tabstop=2
autocmd BufNewFile,BufRead *.{md} set shiftwidth=2 softtabstop=2 tabstop=2

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

" vim-lsp-settings setting
let g:lsp_settings_servers_dir = $HOME."/.local/share/vim-lsp-settings/servers"
let g:lsp_diagnostics_echo_cursor = 1

" vim-goimports
" enable go-imports
let g:goimports = 1

" Fern
" Show hidden files
let g:fern#default_hidden=1
nnoremap <C-n> :Fern . -reveal=% -drawer -toggle -width=40<CR>

" vim-lsp
" see: https://qiita.com/konokenj/items/f619f927f12b1bccfd47
function! s:on_lsp_buffer_enabled() abort
    if &ft =~ 'ctrlp\|dirvish'
        return
    endif
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    nmap <buffer> <leader>a <plug>(lsp-code-action)
    nmap <buffer> <leader>l <plug>(lsp-code-lens)
    nmap <buffer> <leader>L <plug>(lsp-document-diagnostics)
    " nmap <buffer> <leader>d <plug>(lsp-decralation)
    nmap <buffer> <leader>D <plug>(lsp-definition)
    nmap <buffer> <leader>y <plug>(lsp-type-definition)
    nmap <buffer> <leader>i <plug>(lsp-implementation)
    nmap <buffer> <leader>r <plug>(lsp-references)
    nmap <buffer> <leader>R <plug>(lsp-rename)
    nmap <buffer> <leader>S <plug>(lsp-document-symbol)
    nmap <silent><buffer> <C-j> <plug>(lsp-next-diagnostic)
    nmap <silent><buffer> <C-k> <plug>(lsp-previous-diagnostic)

    if &ft =~ 'typescript\|javascript'
        nmap <buffer> <leader>f :LspDocumentFormatSync --server=efm-langserver<CR>
        xmap <buffer> <leader>f :LspDocumentRangeFormatSync --server=efm-langserver<CR>
    else
        nmap <buffer> <leader>f <plug>(lsp-document-format)
        xmap <buffer> <leader>f <plug>(lsp-document-range-format)
    endif
endfunction
augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
" vim-lsp デバッグログの出力
command! LspDebug let lsp_log_verbose=1 | let lsp_log_file = expand('~/lsp.log')

autocmd BufWritePre "*.ts,*.tsx,*.js,*.jsx" call execute('LspDocumentFormatSync')
autocmd BufWritePre "*.go" call execute('LspDocumentFormatSync')
autocmd BufWritePre "*.py" call execute('LspDocumentFormatSync')

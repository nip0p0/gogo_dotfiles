"---------------
" set系
"---------------

" 行頭行末の左右移動で行をまたぐ
" set whichwrap=b,s,h,l,<,>,[,]

" マウスの入力を受け付ける
set mouse=a

" OSのクリップボードをレジスタ指定無しで Yank, Put 出来るようにする
set clipboard=unnamed,unnamedplus

" 外部での変更の自動更新
set autoread

" 自動インデント
set smartindent

"行番号を表示する
set number

"モードラインを書く行数
set modelines=0

"タブラインを非表示
set showtabline=0

"検索のハイライト
set hlsearch

"非互換モード
set nocompatible

"文字コード
set enc=utf-8
set fenc=utf-8
set fencs=ucs-bom,utf-8,iso-2022-jp,euc-jp,cp932

"IME
set imi=0
set ims=0
"ペースト時にオートインデントを無効に 
"set paste

" バックスペースの挙動
set backspace=indent,eol,start

"ファイル中のタブ文字が対応する空白の数
set tabstop=2

"インデントは空白2つ
set shiftwidth=2

"タブが入力されたときの空白の数
set softtabstop=0

"タブではなく適切な数の空白を使う
set expandtab

" 対応する括弧を強調表示
set showmatch

"長い行を折り返さない
"set nowrap

" カーソル先の視界を何行確保するか
set scrolloff=5
set sidescrolloff=16

"バックアップしない
set nobackup

"スワップファイル作らない
set noswapfile

"変更しててもバッファ消せる
set modifiable

"バッファを保存しないで他のファイルを開けるようにする
set hidden

" インクリメンタルサーチしない
set incsearch

" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase

" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase

" 置換の時 g オプションをデフォルトで有効にする
set gdefault

"検索時に最後まで行ったら最初に戻る
set wrapscan
"ステータスラインを表示
set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.&fenc.']['.&ff.']'}%=%l,%c%V%8P

" 右下にカーソルの位置情報を表示
set ruler

"入力したコマンドをステータスラインに表示
set showcmd

" 最初の<Tab>で共通部分まで補完、2回目の<Tab>若しくは最初の<Tab>で共通部分がなかった場合は一覧表示、3回目以降の<Tab>で順番にマッチしたものを完全に補完する。
set wildmode=longest,list,full

" 強化されたコマンドライン補完を使用
set wildmenu

set diffexpr=MyDiff()
"---------------
" デフォルト設定
"---------------

function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

"オートCD
au BufEnter * execute ":lcd " . expand("%:p:h")


"---------------
" キーマップ
"---------------
" visualモードでC-cでコピー
vnoremap <C-c> y:call system("pbcopy", getreg("\""))<CR>

" normalモードで貼り付け
nnoremap <Space><C-v> :call setreg("\"",system("pbpaste"))<CR>p

" 最後に変更した場所へ戻る
map <C-m> `.

" 挿入モードでのカーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>


" Emacs キーバインド
cmap <C-a> <Home>
cmap <C-e> <End>
nnoremap <C-a> <Home>
nnoremap <C-e> <End>
inoremap <C-a> <Home>
inoremap <C-e> <End>

nnoremap <D-¥> \
nnoremap <C-k> d$i 

"表示行単位で移動
nnoremap j gj
nnoremap k gk

"ファイルの文字コードを変更
nmap ,U :set fileencoding=utf-8<CR>
nmap ,E :set fileencoding=euc-jp<CR>
nmap ,S :set fileencoding=cp932<CR>

"ファイルの文字コードを指定して開き直す
nmap =U :e ++enc=utf8<CR>
nmap =S :e ++enc=sjis<CR>
nmap =E :e ++enc=euc-jp<CR>
nmap =J :e ++enc=iso-2022-jp<CR>

"ファイルの改行コードを変更
nmap ,W :set ff=dos<CR>
nmap ,L :set ff=unix<CR>


"---------------
" ファイルタイプ設定
"---------------

augroup FileTypeDetect
  autocmd!
  autocmd BufRead,BufNewFile Capfile,Gemfile      setfiletype ruby
  autocmd BufRead,BufNewFile *.json               setfiletype javascript
  autocmd BufRead,BufNewFile *.coffee             setfiletype coffee
  autocmd BufRead,BufNewFile *.md                 setfiletype markdown
  autocmd BufRead,BufNewFile *.pp                 setfiletype puppet
  autocmd BufRead,BufNewFile *.scss               setfiletype scss
augroup END

augroup FileTypePlugin
  autocmd!
autocmd FileType int-pry    setlocal nonu
  autocmd FileType int-python setlocal nonu
  autocmd FileType java       setlocal ts=4 sts=4 sw=4
  autocmd FileType javascript setlocal ts=2 sts=2 sw=2
  autocmd FileType ruby       setlocal ts=2 sts=2 sw=2
  autocmd FileType python     setlocal ts=4 sts=4 sw=4 si cinw=if,elif,else,for,while,try,except,finally,def,class
  autocmd FileType vim        setlocal ts=2 sts=2 sw=2
  autocmd FileType html       setlocal ts=2 sts=2 sw=2
  autocmd FileType scss       setlocal ts=2 sts=2 sw=2
  autocmd FileType css        setlocal ts=2 sts=2 sw=2
  autocmd FileType markdown   setlocal tw=0
  autocmd FileType vimfiler   setlocal nonu
  autocmd FileType vimshell   setlocal nonu
augroup END


"---------------
" NeoBundle
"---------------

filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

let g:neobundle_default_git_protocol='https'

" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'fholgado/minibufexpl.vim'
NeoBundle 'tpope/vim-ragtag'
NeoBundle 'Railscasts-Theme-GUIand256color'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'osyo-manga/vim-sound'
NeoBundle 'Shougo/vimfiler'

filetype plugin indent on
filetype indent on


"---------------
" カラーリング
"---------------

"256色を使う
set t_Co=256

"シンタックスカラー表示を有効にする
syntax on

"補完候補の色づけ for vim7
"hi Pmenu ctermbg=8
"hi PmenuSel ctermbg=12
"hi PmenuSbar ctermbg=0

"カラーテーマ
colorscheme railscasts

"補完候補の色づけ for vim7
hi Pmenu ctermbg=255 ctermfg=0 guifg=#000000 guibg=#999999
hi PmenuSel ctermbg=blue ctermfg=black
hi PmenuSbar ctermbg=0 ctermfg=9
hi PmenuSbar ctermbg=255 ctermfg=0 guifg=#000000 guibg=#FFFFFF


"---------------
" Neocomplcache
"---------------

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_auto_completion_start_length = 2
let g:neocomplcache_enable_auto_select = 1

""Plugin key-mappings.
" imap <C-k>     <Plug>(neocomplcache_snippets_expand)
" smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g> neocomplcache#undo_completion()
" inoremap <expr><C-l> neocomplcache#complete_common_string()

""Recommended key-mappings.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" inoremap <expr><C-h> neocomplcache#smart_close_popup().”\<C-h>”
" inoremap <expr><BS>  neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplcache#close_popup()
" inoremap <expr><C-e> neocomplcache#cancel_popup()


"---------------
" MiniBufExplorer
"---------------

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
let g:miniBufExplSplitToEdge = 1
let g:miniBufExplCycleArround = 1

""GNU screen likeなキーバインド
let mapleader = ""
nmap <S-Space> :MBEbp<CR>
nmap <Space> :MBEbn<CR>
nmap <C-n> :MBEbp<CR>
nmap <C-p> :MBEbn<CR>
nnoremap <C-X><C-N> :new<CR>
nnoremap <C-X><C-K> :bd<CR>
let mapleader = '\'


"---------------
" RagTag
"---------------

let g:ragtag_global_maps = 1


"---------------
" VimSound
"---------------


"---------------
" Vimfiler
"---------------
autocmd VimEnter * VimFiler -split -simple -winwidth=30 -no-quit
"vim立ち上げのdefaltをvimfilerに
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default=0
let g:netrw_liststyle=3

" カーソル位置を目立たせる
set cursorline
set cursorcolumn

highlight CursorLine ctermbg=254
highlight CursorLine ctermfg=232

highlight CursorColumn ctermbg=254
highlight CursorColumn ctermfg=232






"----------------------------------------------------------------------
" システム
"----------------------------------------------------------------------
" 文字コード ( エンコーディング ) 設定
:set encoding=utf-8
:set fileencoding=utf-8
:set fileencodings=ucs-bom,utf-8,iso-2022-jp,cp932,sjis,euc-jp
:scriptencoding utf-8

" vi互換モードにしない
:set nocompatible

" バックアップ/スワップファイルを作成しない
:set nobackup
:set noswapfile

" ファイルの上書き時、バックアップファイルを作成しない
:set nowritebackup

" コマンドライン補完時、強化されたものを使う
:set wildmenu

" ファイルタイプ検出の有効化
:filetype plugin indent on

"----------------------------------------------------------------------
" 表示
"----------------------------------------------------------------------
" ハイライトを有効にする
:syntax on

" カラースキーマ
:colorscheme default

" 最下ウィンドウにステータスバーを常に表示する
:set laststatus=2

" ステータスバーの内容
:set statusline=%1*
:set statusline+=\ [%n]                                   " バッファ番号
:set statusline+=\ %<%t                                   " ファイル名
:set statusline+=%r%H%W%m                                 " ファイルステータス
:set statusline+=\ [Type:%{strlen(&ft)?&ft:'unknown'}]    " ファイルタイプ
:set statusline+=\ [Enc:%{strlen(&fenc)?&fenc:'unknown'}] " ファイルエンコーディング
:set statusline+=\ [Fmt:%{GetFileFormat()}]               " ファイルフォーマット(改行コード)
:set statusline+=\ %{&bomb?'[BOM]':''}                    " BOMの有無
:set statusline+=%=                                       " 以下、右寄せで表示
:set statusline+=\ [Ascii:%03b]                           " ASCIIコード ( 10進 )
:set statusline+=\ [Hex:0x%02B]                           " ASCIIコード ( 16進 )
:set statusline+=\ [Pos:%03v\ %l/%L]                      " カーソル位置の列 / 行、全行数
:set statusline+=\                                        " パディング

" ファイルフォーマット=>改行コード変換
function! GetFileFormat()
    if &ff == 'unix'
        return 'LF'
    elseif &ff == 'dos'
        return 'CR+LF'
    elseif &ff == 'mac'
        return 'CR'
    else
        return 'unknown'
    endif
endfunction

" 行番号を表示しない
:set nonumber

" 入力中 ( 未実行 ) のコマンドを画面右下に表示する
:set showcmd

" テキストの最大幅 ( 0で無効 )
:set textwidth=0

" ウィンドウ幅より長い行を折り返して表示する
:set wrap

" Tab、行末の半角スペースを明示的に表示する
:set list
:set listchars=tab:^\ ,trail:~

" 全角スペースをハイライトする
augroup highlightDoubleByteSpace
    autocmd!
    autocmd VimEnter,Colorscheme * highlight DoubleByteSpace term=underline ctermbg=LightMagenta guibg=LightMagenta
    autocmd VimEnter,WinEnter * match DoubleByteSpace /　/
augroup END

" □や○の文字があってもカーソル位置がずれないようにする
:set ambiwidth=double

"----------------------------------------------------------------------
" 編集
"----------------------------------------------------------------------
" バッファにクリップボードを利用する
":set clipboard=unnamed,autoselect

" 新しい行のインデントを現在行と同じにする
:set autoindent
:set smartindent

" Visual blockモードでフリーカーソル ( 空行でも選択できる ) を有効にする
:set virtualedit=block

" 対応括弧に '<' と '>' のペアを追加
:set matchpairs& matchpairs+=<:>

" 閉じ括弧 ( ')', ']', '}' ) 入力時、対応する開き括弧をハイライトする
:set showmatch
:set matchtime=0

" 連続した括弧入力時、カーソルを自動的に括弧の中へ移動する
":imap {} {}<Left>
":imap [] []<Left>
":imap () ()<Left>
":imap "" ""<Left>
":imap '' ''<Left>
":imap <> <><Left>
":imap // //<Left>
":imap /// ///<Left>

" <Tab> 挿入時、[set softtabstop]で指定した数の半角スペースを使う
:set expandtab

" <Tab> 挿入時、代わりに挿入される半角スペースの数
:set softtabstop=4

" ファイル内の <Tab> を画面上で表示する際の見た目の文字数
:set tabstop=4

" 自動的に挿入される <Tab> を画面上で表示する際の見た目の文字数
:set shiftwidth=4

"----------------------------------------------------------------------
" 検索
"----------------------------------------------------------------------
" 検索結果をハイライトする
:set hlsearch

" 検索時、ループしないようにする
:set nowrapscan

" 検索時、大文字 / 小文字を区別する
:set noignorecase

" 検索結果を画面の中央に表示する
:nmap n nzz
:nmap N Nzz
:nmap * *zz
:nmap # #zz
:nmap g* g*zz
:nmap g# g#zz

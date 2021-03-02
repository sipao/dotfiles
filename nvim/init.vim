"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  let s:toml_dir = expand('~/dotfiles/nvim')

  call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})
  call dein#load_toml(s:toml_dir . '/dein_lazy.toml', {'lazy': 1})

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')
  " call dein#add('scrooloose/nerdtree')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

syntax on
set encoding=utf-8
set number
set tabstop=4
set softtabstop=4
set expandtab
set smarttab
set shiftround
set shiftwidth=4

set backspace=indent,eol,start

set mouse=a

" マウスドラッグ
if !has('nvim')
  set ttymouse=xterm2
  set clipboard=unnamed,autoselect
endif

set showtabline=2

" 検索
set ignorecase
set smartcase
set wrapscan
set incsearch
set inccommand=split

" python3 for neovim
" let g:python3_host_prog = $PYENV_ROOT . '/shims/python3'
let g:python3_host_prog = substitute(system('which python3'),"\n","","")



" NERDTree -------------------------------------------------------------
nnoremap <silent> <C-e> :NERDTreeToggle<CR>
" デフォルトでツリー表示
autocmd VimEnter * NERDTree
" メインウィンドウへ移行
autocmd VimEnter * wincmd p
" 隠しファイルを表示
let g:NERDTreeShowHidden=1

let NERDTreeHighlightCursorline=1
" ファイルを開いてもNERDTreeを閉じない
let g:NERDTreeQuitOnOpen=0
" 他のバッファをすべて閉じた時にNERDTreeが開いていたらNERDTreeも一緒に閉じる。
autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | q | endif
" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
call NERDTreeHighlightFile('py',     'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('md',     'blue',    'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml',    'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('config', 'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('conf',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('json',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('html',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('styl',   'cyan',    'none', 'cyan',    '#151515')
call NERDTreeHighlightFile('css',    'cyan',    'none', 'cyan',    '#151515')
call NERDTreeHighlightFile('rb',     'Red',     'none', 'red',     '#151515')
call NERDTreeHighlightFile('js',     'Red',     'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php',    'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('vue',    'Green',   'none', '#4fc08d', '#4fc08d')
"End NERDTree -------------------------------------------------------------

"rcmdnk/vim-markdown Start------------------------------------------------------
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
"rcmdnk/vim-markdown End------------------------------------------------------

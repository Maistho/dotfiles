"Dein setup
let $CACHE = expand('~/.cache')
if !($CACHE->isdirectory())
  call mkdir($CACHE, 'p')
endif
if &runtimepath !~# '/dein.vim'
  let s:dir = 'dein.vim'->fnamemodify(':p')
  if !(s:dir->isdirectory())
    let s:dir = $CACHE .. '/dein/repos/github.com/Shougo/dein.vim'
    if !(s:dir->isdirectory())
      execute '!git clone https://github.com/Shougo/dein.vim' s:dir
    endif
  endif
  execute 'set runtimepath^='
        \ .. s:dir->fnamemodify(':p')->substitute('[/\\]$', '', '')
endif

"Dein config
" Ward off unexpected things that your distro might have made, as
" well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Set dein base path (required)
let s:dein_base = '~/.cache/dein/'

" Set dein source path (required)
let s:dein_src = '~/.cache/dein/repos/github.com/Shougo/dein.vim'

" Set dein runtime path (required)
execute 'set runtimepath+=' .. s:dein_src

" Call dein initialization (required)
call dein#begin(s:dein_base)

call dein#add(s:dein_src)

" Your plugins go here:
call dein#add('lambdalisue/vim-suda')
call dein#add('HerringtonDarkholme/yats.vim')
call dein#add('drewtempelmeyer/palenight.vim')

" Finish dein initialization (required)
call dein#end()

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Enable syntax highlighting
if has('syntax')
  syntax on
endif

" Uncomment if you want to install not-installed plugins on startup.
if dein#check_install()
 call dein#install()
endif

" End of Dein config



map <Esc>[27;5;9~ <C-Tab>
map <Esc>[27;6;9~ <C-S-tab>
" Auto stuff
" Remove trailing whitespaces on all lines
autocmd BufWritePre * :%s/\s\+$//e

" Remember the position of the cursor
function! ResCur()
	if line("'\"") <= line("$")
		normal! g`"
		return 1
	endif
endfunction

augroup resCur
	autocmd!
	autocmd BufWinEnter * call ResCur()
augroup END

" Basic stuff
set backspace=2
set showcmd
set nohidden
set lbr

" Theming
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

let g:palenight_color_overrides = {
\    'black': { 'gui': '#000000', "cterm": "0", "cterm16": "0" },
\}
set background=dark
colorscheme palenight

" Use line numbers
set number

" Set proper tabs and indents 4spaces
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent

" Set completion
set wildmenu

" Allow use of mouse
set mouse=a

" Search with smart case sensitivity
set ignorecase
set smartcase

set incsearch
set hlsearch
set grepprg=grep\ -H\ $*

" Persistent undo
" not working? TODO: check why
set undodir=~/.vim/undodir
set undofile
set undolevels=1000
set undoreload=10000

" Buffer navigation
nnoremap <C-S-tab> :tabp<CR>
nnoremap <C-tab>   :tabn<CR>
inoremap <C-S-tab> <Esc>:tabp<CR>
inoremap <C-tab>   <Esc>:tabn<CR>

" linewrap up/down navigation
nnoremap k gk
nnoremap j gj
nnoremap <Down> g<Down>
nnoremap <Up> g<Up>
inoremap <Down> <C-o>g<Down>
inoremap <Up> <C-o>g<Up>

" Set mustache filetype for handlebars
autocmd BufNewFile,BufRead *.handlebars   set ft=mustache

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w suda://%

" Show a different color when a line becomes too long
"let &colorcolumn="80,".join(range(120,999),",")

"LaTeX stuff
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

"Html files
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType php setlocal shiftwidth=2 tabstop=2

" ================ General Config ====================
syntax on
let mapleader=","
set nocompatible clipboard=unnamed "y, yy, d, dd copy to Mac clipboard
set number backspace=2 history=1000 showcmd visualbell autoread hidden
set autoindent smartindent shiftwidth=2 softtabstop=2 tabstop=2 expandtab
set timeoutlen=1000 ttimeoutlen=10 splitright splitbelow

" ================ Plugins ====================
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
let g:vundle_default_git_proto='git'
let g:airline_powerline_fonts = 1
let g:netrw_liststyle=3
let g:jsx_ext_required = 0
let g:ycm_path_to_python_interpreter = '/usr/local/bin/python2'
let g:vim_markdown_folding_disabled = 1

call vundle#begin()
Plugin 'gmarik/vundle'
Plugin 'sjl/gundo.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ternjs/tern_for_vim'
Plugin 'kien/ctrlp.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'Townk/vim-autoclose'
Plugin 'inkarkat/closetag.vim'
Plugin 'tmhedberg/matchit'
"Plugin 'godlygeek/tabular'
"Plugin 'mattn/emmet-vim'
"Plugin 'tpope/vim-repeat'
call vundle#end()
filetype plugin indent on

let g:syntastic_javascript_checkers = ['standard']
"autocmd bufwritepost *.js silent !standard --fix %
"set autoread

" ================ Shortcuts ====================
nnoremap ; :
inoremap jj <ESC>
inoremap jk <ESC>
inoremap kj <ESC>
" new split and switch to it
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>s <C-w>s<C-w>j
" move around splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" plugins & vim
nnoremap <leader>q :q<CR>
nnoremap <leader>p :CtrlP<CR>
nnoremap <C-g> :GundoToggle<CR>
nnoremap <C-n> :NERDTreeTabsToggle<CR>
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
" resize current split
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
" for when we forget to use sudo to open/edit a file
cmap w!! w !sudo tee % >/dev/null
" Remove trailing whitespace on <leader>S
"nnoremap <leader>S :%s/\s\+$//<CR>:let @/=''<CR>

" ================ Basic Settings ====================
filetype on                   " try to detect filetypes
set title                     " show title in console title bar
set wildmenu                  " menu completion in command mode on <Tab>
set wildmode=full             " <Tab> cycles between all matching choices.
set backup                    " keep a backup file
set backupdir=~/.vim/_backups " store backups here
set directory=~/.vim/_swaps   " store swap files here
set backupskip=/tmp/*,/private/tmp/* " Don't buffer crontab
set noerrorbells
set vb t_vb=                  " no blinking

" Ignore these files when completing
set wildignore+=*/tmp/*,.git,*.pyc,.DS_Store,*.swp,*.zip,*/venv/*
set wildignore+=eggs/**
set wildignore+=*.egg-info/**

"autocmd FileType python setlocal shiftwidth=4 tabstop=4 sts=4

""" Moving Around/Editing
set ruler                   " show the cursor position all the time
"set nostartofline           " Avoid moving cursor to BOL when jumping around
set virtualedit=block       " Let cursor move past the last char in <C-v> mode
set scrolloff=6             " Keep 6 context lines above and below the cursor
set sidescrolloff=15
set sidescroll=1
set shiftround              " rounds indent to a multiple of shiftwidth
set formatoptions=tcroql    " Setting text and comment formatting to auto
set nowrap                  " Wrap text

""" Messages, Info, Status
set ls=2                    " always show status line
set report=0                " : commands always print changed line count.
set shortmess+=a            " Use [+]/[RO]/[w] for modified/readonly/written.
set laststatus=2            " Always show statusline, even if only 1 window.

""" Searching and Patterns
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex

" ================ Persistent Undo ==================
if exists("+undofile")
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=~/.vim/undo//
  set undofile
endif

hi DiffText gui=underline guibg=red guifg=black

" iTerm cursor shape
if $TERM_PROGRAM =~ "iTerm"
  let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
  let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

" ================ ctrlp ====================
if executable('ag')
  " Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast, respects .gitignore
  " and .agignore. Ignores hidden files by default.
  let g:ctrlp_user_command = 'ag %s -l --nocolor -f -g ""'
else
  "ctrl+p ignore files in .gitignore
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
endif

" Use the nearest .git directory as the cwd
let g:ctrlp_working_path_mode = 'r'

" ================ Daylight ==========================
let hour = strftime("%H")
if 6 <= hour && hour < 18
  set background=light
else
  set background=dark
endif
"set background=dark
colorscheme solarized

" https://www.jeffknupp.com/blog/2013/12/04/my-development-environment-for-python/
" https://github.com/jeffknupp/dotfiles/blob/master/.vimrc
" https://github.com/skwp/dotfiles/blob/master/vimrc

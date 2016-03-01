set nocompatible
set clipboard=unnamed       "Normal vim copy commands y, yy, d, dd copy to Mac clipboard

let hour = strftime("%H")
if 7 <= hour && hour < 18
  set background=light
else
  set background=dark
endif
colorscheme solarized

" ================ General Config ====================

set number                  "Display line numbers
set backspace=2             "Allow backspacing over autoindent, EOL, and BOL
set history=1000
set showcmd                 "Show incomplete normal mode commands as I type.
set visualbell              "No sounds
set autoread                "Reload files changed outside vim
set hidden
syntax on                   "Syntax highlighing
let mapleader=","
"set showmode               "Show current mode down the bottom

" ================ Indentation ====================

set autoindent              " always set autoindenting on
set smartindent             " use smart indent if there is no indent file
set shiftwidth=2            " And an indent level is 4 spaces wide.
set softtabstop=2           " <BS> over an autoindent deletes all spaces.
set tabstop=2               " <tab> inserts 4 spaces 
set expandtab               " Use spaces, not tabs, for autoindent/tab key.

" ================ Plugins ====================

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
let g:vundle_default_git_proto='git'
let g:airline_powerline_fonts = 1
let g:netrw_liststyle=3
set timeoutlen=1000 ttimeoutlen=10
call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'sjl/gundo.vim'
Plugin 'digitaltoad/vim-jade'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'marijnh/tern_for_vim'
Plugin 'kien/ctrlp.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mattn/emmet-vim'
Plugin 'chase/vim-ansible-yaml'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'rdnetto/YCM-Generator'

"Plugin 'tpope/vim-surround'
"Plugin 'scrooloose/nerdtree'
"Plugin 'tpope/vim-repeat'
"Plugin 'plasticboy/vim-markdown' 
"Plugin 'scrooloose/syntastic'
"Plugin 'altercation/vim-colors-solarized'
"Plugin 'wincent/Command-T'
"Plugin 'Shougo/vimproc'
"Plugin 'Shougo/vimshell'

call vundle#end()
filetype plugin indent on

" ================ Shortcuts ====================

autocmd FileType python nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>

nnoremap ; :
inoremap jj <ESC>
inoremap jk <ESC>
inoremap kj <ESC>

" new vertical split and switch to it
map <leader>w <C-w>v<C-w>l
" move around splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" insert mode too
imap <C-W> <C-O><C-W>

nnoremap <leader>q :q<cr>
nnoremap <leader>g :GundoToggle<CR>
nnoremap <leader><space> :nohlsearch<cr>
nnoremap <leader>P Oimport pdb; pdb.set_trace()
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

nmap <leader>p :CtrlP<cr>
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

" for when we forget to use sudo to open/edit a file
cmap w!! w !sudo tee % >/dev/null

" ==========================================================
" Basic Settings
" ==========================================================

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
set wildignore+=*/tmp/*,.git,*.pyc,.DS_Store,*.swp,*.zip
set wildignore+=eggs/**
set wildignore+=*.egg-info/**

"autocmd FileType python setlocal shiftwidth=2 tabstop=2 sts=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 sts=2
autocmd FileType coffee setlocal shiftwidth=2 tabstop=2 sts=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2 sts=2
autocmd FileType jade setlocal shiftwidth=2 tabstop=2 sts=2

""" Moving Around/Editing
set ruler                   " show the cursor position all the time
set nostartofline           " Avoid moving cursor to BOL when jumping around
set virtualedit=block       " Let cursor move past the last char in <C-v> mode
set scrolloff=6             " Keep 6 context lines above and below the cursor
set sidescrolloff=15
set sidescroll=1
set shiftround              " rounds indent to a multiple of shiftwidth
set formatoptions=tcroql    " Setting text and comment formatting to auto
set nowrap                    " Wrap text
"set textwidth=80            " lines are automatically wrapped after 80 columns
"set nofoldenable            " turn off folding
"set colorcolumn=80          " highlight column 80 (where words will wrap)
"set showmatch               " Briefly jump to a paren once it's balanced
"set linebreak               " don't wrap textin the middle of a word

""" Reading/Writing
"set autowriteall            " Don't bother me about changed buffers
"set noautoread              " Don't automatically re-read changed files.
"set modeline                " Allow vim options to be embedded in files;
"set modelines=5             " they must be within the first or last 5 lines.

""" Messages, Info, Status
set ls=2                    " always show status line
set report=0                " : commands always print changed line count.
set shortmess+=a            " Use [+]/[RO]/[w] for modified/readonly/written.
set ruler                   " Show some info, even without statuslines.
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

" CtrlP
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" Use the nearest .git directory as the cwd
let g:ctrlp_working_path_mode = 'r'

" ============== Learning Vim ================

" No arrow keys!
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" ================ Exras ==================

" Enable list of buffers at top of window and just show filename
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#fnamemod = ':t'

" Paste from clipboard
"map <leader>p "+p

" Remove trailing whitespace on <leader>S
"nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>

" Select the item in the list with enter
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"map <C-space> :bn<CR>
"map <C-M-space> :bp<CR>

" Preview Markdown files with QuickLook
"map <Leader>v :write<cr>:sil !/usr/bin/qlmanage -p % > /dev/null &<cr>:redraw!<cr>
"set guifont=Sauce\ Code\ Powerline:h14)

" OmniComplete - http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
"set completeopt=longest,menuone
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" https://www.jeffknupp.com/blog/2013/12/04/my-development-environment-for-python/
" https://github.com/jeffknupp/dotfiles/blob/master/.vimrc
" https://github.com/skwp/dotfiles/blob/master/vimrc

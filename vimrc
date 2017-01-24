" >^.^<

" ================ General Config ====================
filetype on
let mapleader=","
set clipboard=unnamed "y, yy, d, dd copy to Mac clipboard
set title ruler number relativenumber showcmd visualbell noerrorbells
set hidden smartindent shiftwidth=2 softtabstop=2 tabstop=2 expandtab
set timeoutlen=1000 ttimeoutlen=10 splitright splitbelow
set nowrap mouse=c ls=2 report=0 shortmess+=a laststatus=2
set ignorecase smartcase hlsearch incsearch wildmenu wildmode=full
set virtualedit=block scrolloff=6 sidescrolloff=15 sidescroll=1 shiftround
set formatoptions=tcroql "Setting text and comment formatting to auto
set vb t_vb= "no blinking
set backup backupdir=~/.vim/_backups directory=~/.vim/_swaps
set backupskip=/tmp/*,/private/tmp/* " Don't buffer crontab
set wildignore+=*/tmp/*,.git,*.pyc,.DS_Store,*.swp,*.zip,*/venv/*,*/node_modules/*
"set nostartofline "Avoid moving cursor to BOL when jumping around
"set termguicolors
"autocmd FileType python setlocal shiftwidth=4 tabstop=4 sts=4

if !has('nvim')
  set nocompatible backspace=2 history=10000 autoread autoindent
endif

" ================ Plugins ====================
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')
Plug 'ctrlpvim/ctrlp.vim',        { 'on': ['CtrlP', 'CtrlPBuffer', 'CtrlPMRU', 'CtrlPMixed'] }
Plug 'sjl/gundo.vim',             { 'on': 'GundoToggle' }
Plug 'scrooloose/nerdtree',       { 'on': 'NERDTreeTabsToggle' }
Plug 'jistr/vim-nerdtree-tabs',   { 'on': ['NERDTreeToggle', 'NERDTreeFind', 'NERDTreeTabsToggle', 'NERDTreeTabsFind'] }
Plug 'tpope/vim-surround'
Plug 'pangloss/vim-javascript',   { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx',               { 'for': ['jsx', 'javascript.jsx'] }
Plug 'plasticboy/vim-markdown',   { 'for': 'markdown' }
Plug 'scrooloose/syntastic',      { 'for': ['javascript', 'javascript.jsx'] }
Plug 'inkarkat/closetag.vim',     { 'for': ['html', 'css', 'javascript.jsx'] } " <c-_>
"Plug 'mattn/emmet-vim',           { 'for': ['html', 'css', 'javascript.jsx'] } " <c-y>,
Plug 'tmhedberg/matchit'          " % finds next thing
Plug 'Townk/vim-autoclose'        " '(' produces ')'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Valloric/YouCompleteMe',    { 'do': './install.py --tern-completer' }
"Plug 'Shougo/deoplete.nvim',      { 'do': ':UpdateRemotePlugins' }
Plug 'ervandew/supertab'
Plug 'ternjs/tern_for_vim',       { 'do': 'yarn', 'for': ['javascript', 'javascript.jsx'] }
"Plug 'carlitux/deoplete-ternjs',  { 'do': 'yarn global add tern', 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/jspc.vim',           { 'for': ['javascript', 'javascript.jsx'] }
"Plug 'tpope/vim-fugitive'
"Plug 'scrooloose/nerdcommenter'
"Plug 'godlygeek/tabular'
"Plug 'tpope/vim-repeat'

"if has('nvim')
"elseif has('lua')
"  Plug 'Shougo/neocomplete.vim', { 'do': ':NeoCompleteEnable' }
"else
"  Plug 'Valloric/YouCompleteMe'
"endif

call plug#end()

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

"let g:deoplete#enable_at_startup = 1
"let g:deoplete#omni#functions = {}
"let g:deoplete#omni#functions.javascript = ['tern#Complete', 'jspc#omni']
"set completeopt=longest,menuone,preview
"let g:deoplete#sources = {}
"let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']
"let g:tern#command = ['tern']
"let g:tern#arguments = ['--persistent']
"autocmd FileType javascript let g:SuperTabDefaultCompletionType = '<c-x><c-o>'
"let g:UltiSnipsExpandTrigger='<C-j>'
"inoremap <expr><TAB> pumvisible() ? '\<C-n>' : '\<TAB>'

let g:airline_powerline_fonts=1
let g:netrw_liststyle=3
let g:jsx_ext_required=0
let g:vim_markdown_folding_disabled=1
"let g:user_emmet_settings = {'javascript' : {'extends' : 'jsx'}}
let g:ycm_path_to_python_interpreter='/usr/local/bin/python2'
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "closes preview split when leaving insert mode

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
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

" ================ Persistent Undo ==================
if exists("+undofile")
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=~/.vim/undo//
  set undofile
endif

hi DiffText gui=underline guibg=red guifg=black

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

" >^.^<

" ================ General Config ====================
filetype on
let mapleader=","
set clipboard+=unnamedplus " y, yy, d, dd copy to Mac clipboard
set title ruler number relativenumber showcmd visualbell noerrorbells
set hidden smartindent shiftwidth=2 softtabstop=2 tabstop=2 expandtab
set timeoutlen=1000 ttimeoutlen=10 splitright splitbelow
set nowrap mouse=a ls=2 report=0 shortmess+=a laststatus=2
set ignorecase smartcase hlsearch incsearch wildmenu wildmode=full
set virtualedit=block scrolloff=6 sidescrolloff=15 sidescroll=1 shiftround
set vb t_vb= " no blinking
set backup backupcopy=yes backupdir=~/.vim/_backups directory=~/.vim/_swaps
set backupskip=/tmp/*,/private/tmp/* " Don't buffer crontab
set wildignore+=*/tmp/*,.git,*.pyc,.DS_Store,*.swp,*.zip,*/venv/*,*/node_modules/*
set updatetime=250
" set nostartofline " Avoid moving cursor to BOL when jumping around
" set termguicolors
" autocmd FileType python setlocal shiftwidth=4 tabstop=4 sts=4

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
Plug 'ctrlpvim/ctrlp.vim',              { 'on': ['CtrlP', 'CtrlPBuffer', 'CtrlPMRU', 'CtrlPMixed'] }
Plug 'sjl/gundo.vim',                   { 'on': 'GundoToggle' }
Plug 'myusuf3/numbers.vim'
Plug 'tomtom/tcomment_vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'mileszs/ack.vim'
Plug 'alampros/vim-styled-jsx',         { 'for': ['javascript', 'javascript.jsx'] }
Plug 'pangloss/vim-javascript',         { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx',                     { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'elzr/vim-json'
Plug 'plasticboy/vim-markdown',         { 'for': 'markdown' }
Plug 'w0rp/ale',                        { 'for': ['javascript', 'javascript.jsx'] }
Plug 'inkarkat/closetag.vim',           { 'for': ['html', 'css', 'javascript.jsx'] } " <C-_>
Plug 'mattn/emmet-vim',                 { 'for': ['html', 'css', 'javascript.jsx'] } " <C-y>,
Plug 'tmhedberg/matchit'                " % finds next thing
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Valloric/YouCompleteMe',          { 'do': '/usr/local/bin/python2 ./install.py --js-completer' }
Plug 'ternjs/tern_for_vim',             { 'do': 'yarn', 'for': ['javascript', 'javascript.jsx'] }
Plug 'chrisbra/Recover.vim'
Plug 'hail2u/vim-css3-syntax'
" Plug 'fleischie/vim-styled-components'
Plug 'Raimondi/delimitMate'             " '(' produces ')'
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jparise/vim-graphql'
" Plug 'honza/vim-snippets'
" Plug 'SirVer/ultisnips'

" Plug 'tpope/vim-repeat'
" Plug 'othree/yajs.vim',                 { 'for': ['javascript', 'javascript.jsx'] }
" Plug 'othree/es.next.syntax.vim',       { 'for': ['javascript', 'javascript.jsx'] }
" Plug 'kien/rainbow_parentheses.vim'
" Plug 'jistr/vim-nerdtree-tabs',         { 'on': ['NERDTreeToggle', 'NERDTreeFind', 'NERDTreeTabsToggle', 'NERDTreeTabsFind'] }
" deoplete:
" if has('nvim')
"   Plug 'Shougo/deoplete.nvim',          { 'do': ':UpdateRemotePlugins' }
" else
"   Plug 'Shougo/deoplete.nvim'
"   Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc'
" endif
" Plug 'carlitux/deoplete-ternjs',        { 'do': 'yarn global add tern', 'for': ['javascript', 'javascript.jsx'] }
" Plug 'ervandew/supertab'

call plug#end()

" ultisnips
" let g:UltiSnipsExpandTrigger='<C-S-Tab>'
" let g:UltiSnipsJumpForwardTrigger='<C-S-n>'
" let g:UltiSnipsJumpBackwardTrigger='<C-S-p>'
" w0rp/ale
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
" let g:ale_lint_on_enter = 0 "prevent linting when opening a file
let g:ale_sign_column_always = 1
let g:ale_linters = {}
let g:ale_linters['javascript'] = ['standard']
" let g:ale_javascript_standard_options = '--parser babel-eslint'
let g:ale_fix_on_save = 1
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier_standard']

let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let g:airline_powerline_fonts=1
let g:airline#extensions#branch#displayed_head_limit = 10
let g:airline#extensions#default#section_truncate_width = {
  \ 'b': 85,
  \ 'x': 110,
  \ 'y': 110,
  \ 'z': 45,
  \ 'warning': 80,
  \ 'error': 80,
\ }
let g:netrw_liststyle=3
let g:jsx_ext_required=0
let g:vim_markdown_folding_disabled=1
let g:user_emmet_settings = {'javascript' : {'extends' : 'jsx'}}
let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'
let g:ycm_path_to_python_interpreter='/usr/local/bin/python2'
let g:ycm_filetype_blacklist = { 'markdown': 1, 'text': 1 }
let g:ackprg = 'ag --vimgrep'
let g:used_javascript_libs = 'underscore,react'
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "closes preview split when leaving insert mode

" ================ Shortcuts ====================
nnoremap ; :
inoremap jj <Esc>
inoremap jk <Esc>
inoremap kj <Esc>
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
nnoremap <C-n> :NERDTreeToggle<CR>
cnoreabbrev Ack Ack!
cnoreabbrev ack Ack!
nnoremap <Leader>a :Ack!<Space>
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
" resize splits
nnoremap <silent> <S-Left> :vertical resize -5<CR>
nnoremap <silent> <S-Right> :vertical resize +5<CR>
nnoremap <silent> <S-Up> :res -5<CR>
nnoremap <silent> <S-Down> :res +5<CR>
" for when we forget to use sudo to open/edit a file
cmap w!! w !sudo tee % >/dev/null
" Remove trailing whitespace on <leader>S
" nnoremap <leader>S :%s/\s\+$//<CR>:let @/=''<CR>
nnoremap <leader>P oimport pdb; pdb.set_trace()<Esc>

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
  " ctrl+p ignore files in .gitignore
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
colorscheme solarized

" https://www.jeffknupp.com/blog/2013/12/04/my-development-environment-for-python/
" https://github.com/jeffknupp/dotfiles/blob/master/.vimrc
" https://github.com/skwp/dotfiles/blob/master/vimrc
"
" deoplete, snips, etc
" let g:deoplete#enable_at_startup = 1
" let g:deoplete#omni#functions = {}
" let g:deoplete#omni#functions.javascript = ['tern#Complete', 'jspc#omni']
" set completeopt=longest,menuone,preview
" let g:deoplete#sources = {}
" let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']
" let g:tern#command = ['tern']
" let g:tern#arguments = ['--persistent']
" autocmd FileType javascript let g:SuperTabDefaultCompletionType = '<c-x><c-o>'
" inoremap <expr><TAB> pumvisible() ? '\<C-n>' : '\<TAB>'

" Put these lines at the very end of your vimrc file.

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL

" >^.^<

" ================ General Config ====================
filetype on
let mapleader=","
set clipboard+=unnamedplus " y, yy, d, dd copy to Mac clipboard
set title ruler number relativenumber showcmd visualbell noerrorbells
set hidden smartindent shiftwidth=2 softtabstop=2 tabstop=2 expandtab
set timeoutlen=1000 ttimeoutlen=10 splitright splitbelow
set nowrap mouse=a ls=2 report=0 shortmess+=a shortmess+=c laststatus=2
set ignorecase smartcase hlsearch incsearch wildmenu wildmode=full
set virtualedit=block scrolloff=6 sidescrolloff=15 sidescroll=1 shiftround
set vb t_vb= " no blinking
set backup backupcopy=yes backupdir=~/.vim/_backups directory=~/.vim/_swaps
set backupskip=/tmp/*,/private/tmp/* " Don't buffer crontab
set wildignore+=*/tmp/*,.git,*.pyc,.DS_Store,*.swp,*.zip,*/venv/*,*/node_modules/*
set updatetime=250
set noshowmode
set signcolumn=yes
set nobackup " for ts-server
set nowritebackup " for ts-server
set cmdheight=2
" set nostartofline " Avoid moving cursor to BOL when jumping around

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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree',
Plug 'myusuf3/numbers.vim'
Plug 'tomtom/tcomment_vim'
Plug 'scrooloose/nerdtree',             { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'tpope/vim-surround'
Plug 'sheerun/vim-polyglot'
Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'moll/vim-node',                   { 'for': ['javascript', 'javascript.jsx'] }
Plug 'elzr/vim-json'
Plug 'pantharshit00/vim-prisma'
Plug 'inkarkat/closetag.vim',           { 'for': ['html', 'css', 'javascript.jsx'] } " <C-_>
Plug 'mattn/emmet-vim',                 { 'for': ['html', 'css', 'javascript.jsx'] } " <C-y>,
Plug 'tmhedberg/matchit'                " % finds next thing
Plug 'connorholyday/vim-snazzy'
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim',               { 'branch': 'release' }
Plug 'chrisbra/Recover.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'Raimondi/delimitMate'             " '(' produces ')'
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-eunuch'
Plug 'blueyed/vim-diminactive'
Plug 'pechorin/any-jump.vim'
Plug 'tpope/vim-repeat'
Plug 'easymotion/vim-easymotion'
Plug 'pixelastic/vim-undodir-tree'
Plug 'github/copilot.vim'
" Plug 'honza/vim-snippets'
" Plug 'SirVer/ultisnips'
" Plug 'othree/yajs.vim',                 { 'for': ['javascript', 'javascript.jsx'] }
" Plug 'othree/es.next.syntax.vim',       { 'for': ['javascript', 'javascript.jsx'] }
" Plug 'kien/rainbow_parentheses.vim'
" Plug 'ervandew/supertab'
" Plug 'flowtype/vim-flow',               { 'for': ['javascript', 'javascript.jsx'] }
" Plug 'alampros/vim-styled-jsx',         { 'for': ['javascript', 'javascript.jsx'] }
" Plug 'fleischie/vim-styled-components'
call plug#end()

" ultisnips
" let g:UltiSnipsExpandTrigger='<C-S-Tab>'
" let g:UltiSnipsJumpForwardTrigger='<C-S-n>'
" let g:UltiSnipsJumpBackwardTrigger='<C-S-p>'

" CoC
let g:coc_global_extensions = [
  \'coc-css',
  \'coc-eslint',
  \'coc-format-json',
  \'coc-html',
  \'coc-json',
  \'coc-prettier',
  \'coc-prisma',
  \'coc-pyright',
  \'coc-sh',
  \'coc-sql',
  \'@yaegassy/coc-tailwindcss3',
  \'coc-tsserver',
\]
let g:copilot_no_tab_map = v:true
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ exists('b:_copilot.suggestions') ? copilot#Accept("\<CR>") :
      \ CheckBackSpace() ? "\<Tab>" :
      \ coc#refresh()
function! CheckBackSpace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" inoremap <silent><expr> <C-j> coc#pum#visible() ? coc#pum#next(1) : "\<C-j>"
" inoremap <silent><expr> <C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-k>"
" Use <c-space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> g[ <Plug>(coc-diagnostic-prev)
nmap <silent> g] <Plug>(coc-diagnostic-next)
" Remap keys for actions
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gs :CocCommand tsserver.goToSourceDefinition<CR>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gu <Plug>(coc-references)
nmap <silent> gr <Plug>(coc-rename)
nmap <silent> g. <Plug>(coc-codeaction)
" coc-react-refactor
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <silent> gf <Plug>(coc-fix-current)
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" other settings
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let g:netrw_liststyle=3
let g:jsx_ext_required=0
let g:undotree_SetFocusWhenToggle = 1
let NERDTreeQuitOnOpen=1
let g:vim_markdown_folding_disabled=1
let g:user_emmet_settings = {'javascript' : {'extends' : 'jsx'}}
let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'
let g:ackprg = 'ag --vimgrep'
let g:used_javascript_libs = 'underscore,react'
let g:tcomment#filetype#guess_typescriptreact = 1
let g:NERDTreeCaseSensitiveFS=3
"closes preview split when leaving insert mode
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" lightline full path (requires vim-fugitive)
" https://github.com/itchyny/lightline.vim/issues/293
let g:lightline = { 'component_function': { 'filename': 'LightlineFilename' } }

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

" ================ Shortcuts ====================
inoremap ii <Esc>

" new split and switch to it
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>s <C-w>s<C-w>j

" move around splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" scroll speed 1
noremap <ScrollWheelUp>     <C-Y>
noremap <2-ScrollWheelUp>   <C-Y>
noremap <3-ScrollWheelUp>   <C-Y>
noremap <4-ScrollWheelUp>   <C-Y>
noremap <5-ScrollWheelUp>   <C-Y>
noremap <ScrollWheelDown>   <C-E>
noremap <2-ScrollWheelDown> <C-E>
noremap <3-ScrollWheelDown> <C-E>
noremap <4-ScrollWheelDown> <C-E>
noremap <5-ScrollWheelDown> <C-E>

" plugins & vim
nnoremap <leader>q :q<CR>
nnoremap <leader>p :Files<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>r :Rg<CR>
nnoremap <leader>a :Ag<CR>
nnoremap <leader>g :UndotreeToggle<CR>
nnoremap <leader>t :NERDTreeFind<CR>
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

colorscheme snazzy

" https://www.jeffknupp.com/blog/2013/12/04/my-development-environment-for-python/
" https://github.com/jeffknupp/dotfiles/blob/master/.vimrc
" https://github.com/skwp/dotfiles/blob/master/vimrc

" Put these lines at the very end of your vimrc file:
" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL

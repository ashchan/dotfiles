set nocompatible
set clipboard=unnamed
set timeout timeoutlen=1000 ttimeoutlen=100

let g:ruby_path = system('which ruby | sed "s/ruby$//"')
set re=1

" Set encoding
set encoding=utf-8

" Whitespace stuff
set nowrap
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set list listchars=tab:\ \ ,trail:·

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*,vendor/ruby/*,node_modules/*

" Status bar
set laststatus=2

set noequalalways

let mapleader = ","

filetype off

call plug#begin('~/.vim/plugged')

  Plug 'mileszs/ack.vim'
  Plug 'kien/ctrlp.vim'
  Plug 'jgdavey/vim-turbux'
  Plug 'tpope/vim-dispatch'
  Plug 'tpope/vim-fugitive'
  Plug 'scrooloose/nerdcommenter'
  Plug 'junegunn/vim-easy-align'
  Plug 'bronson/vim-trailing-whitespace'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'terryma/vim-expand-region'
  Plug 'mikewest/vimroom'
  Plug 'rizzatti/dash.vim'

  Plug 'tpope/vim-rails'
  Plug 'elixir-lang/vim-elixir'
  Plug 'AndrewRadev/splitjoin.vim'
  Plug 'mattn/emmet-vim'
  Plug 'kchmck/vim-coffee-script'
  Plug 'pangloss/vim-javascript'
  "Plug 'elzr/vim-json'
  Plug 'maksimr/vim-jsbeautify'
  Plug 'plasticboy/vim-markdown'
  "Plug 'slim-template/vim-slim', { 'for': 'slim' }

  Plug 'ap/vim-css-color'
  Plug 'cakebaker/scss-syntax.vim'

  "Plug 'fatih/vim-go'

  "Plug 'ekalinin/Dockerfile.vim'

call plug#end()

filetype on
filetype plugin indent on

set number
set ruler
syntax on

if has("mouse")
  set mouse=a
  if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
  endif
endif

" CTags
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
map <C-\> :tnext<CR>

" Marked
:map <leader>m :!open -a "Marked 2.app" '%:p'<CR><CR>

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

function s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=72
endfunction

au FileType make set noexpandtab
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Capfile,config.ru}    set ft=ruby
au BufRead,BufNewFile {Dockerfile*,*.dock} set ft=Dockerfile
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} set ft=markdown " call s:setupMarkup()
au BufNewFile,BufRead *.{js} set ft=javascript
au FileType javascript set tabstop=2 softtabstop=2 shiftwidth=2
au BufRead,BufNewFile *.txt call s:setupWrapping()
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79
au BufRead,BufNewFile *.rabl set ft=ruby
au BufRead,BufNewFile {Cakefile} set ft=coffee
au BufRead,BufNewFile *.coffee set ft=coffee
au BufRead,BufNewFile *.scss set ft=scss
au BufRead,BufNewFile *.less set ft=less
au BufRead,BufNewFile *.jade set ft=jade
au BufRead,BufNewFile *.slim set ft=slim
au BufRead,BufNewFile,BufReadPost *.go set ft=go
au FileType crontab setlocal nobackup nowritebackup
au FileType go set noexpandtab tabstop=4 softtabstop=4 shiftwidth=4
au FileType objc set tabstop=4 softtabstop=4 shiftwidth=4
autocmd Filetype gitcommit setlocal spell textwidth=72

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Use modeline overrides
set modeline
set modelines=10

" Show (partial) command in the status line
set showcmd

set dir=~/.vim/_swap//

set nobackup
" Directories for swp files
" set backupdir=~/.vim/backup
" set directory=~/.vim/backup

set t_Co=256
set background=dark

" Use blowfish for encryption
set cm=blowfish

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
  let g:ackhighlight = 1
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
  let g:ctrlp_user_command = 'rg %s --files -g ""'
  let g:ctrlp_use_caching = 0
endif

let g:ackprg = 'rg --vimgrep --no-heading --column'
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
nnoremap <silent> <Leader>f :Ack<space>

" kien/ctrlp.vim
let g:ctrlp_working_path_mode = 2
let g:ctrlp_dotfiles = 0

" netrw
map <Leader>n :Explore<CR>
let g:netrw_list_hide= '.*\.swp$,\.DS_Store,\.git/,log/\.sass-cache/,^tags$,\.bundle/'

" junegunn/vim-easy-align
vnoremap <silent> <Enter> :EasyAlign<cr>

" OpenURL for rails.vim
:command -bar -nargs=1 OpenURL :!open <args>

" jgdavey/vim-turbux
let g:turbux_command_prefix = 'bundle exec'

" ap/vim-css-color
let g:cssColorVimDoNotMessMyUpdatetime = 1

" Valloric/YouCompleteMe
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_server_python_interpreter='/usr/local/bin/python3'

" rizzatti/dash.vim
:nmap <silent> Q <Plug>DashSearch

" mattn/emmet-vim
let g:user_emmet_settings = { 'indentation' : '  ' }

" plasticboy/vim-markdown
let g:vim_markdown_folding_disabled=1

color slate

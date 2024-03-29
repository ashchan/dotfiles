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
  Plug 'rizzatti/dash.vim'
  Plug 'tpope/vim-rails'
  Plug 'pangloss/vim-javascript'
  Plug 'plasticboy/vim-markdown'
  Plug 'ap/vim-css-color'
  Plug 'cakebaker/scss-syntax.vim'
  Plug 'dracula/vim'
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
au BufRead,BufNewFile *.scss set ft=scss
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
set noswapfile
" Directories for swp files
" set backupdir=~/.vim/backup
" set directory=~/.vim/backup

set t_Co=256
set background=dark

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
map <Leader>n :Lexplore<CR>
let g:netrw_list_hide= '.*\.swp$,\.DS_Store,\.git/,log/\.sass-cache/,^tags$,\.bundle/'
let g:netrw_liststyle=1
let g:netrw_winsize = 25

" OpenURL for rails.vim
:command -bar -nargs=1 OpenURL :!open <args>

" jgdavey/vim-turbux
let g:turbux_command_prefix = 'bundle exec'

" ap/vim-css-color
let g:cssColorVimDoNotMessMyUpdatetime = 1

" rizzatti/dash.vim
:nmap <silent> Q <Plug>DashSearch

" plasticboy/vim-markdown
let g:vim_markdown_folding_disabled=1

color dracula

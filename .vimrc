set nocompatible
set clipboard=unnamed
set timeout timeoutlen=1000 ttimeoutlen=100

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

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*,vendor/ruby/*,node_modules/*

" Status bar
set laststatus=2

set noequalalways

let mapleader = ","

filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'

filetype on
filetype plugin indent on

set number
set ruler
syntax on

" NERDTree configuration
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
map <Leader>n :NERDTreeToggle<CR>

" CTags
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
map <C-\> :tnext<CR>

" Ack
nnoremap <silent> <Leader>f :Ack<space>

" Marked
:map <leader>m :!open -a Marked.app '%:p'<CR><CR>

" OpenURL for rails.vim
:command -bar -nargs=1 OpenURL :!open <args>

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

" make uses real tabs
au FileType make set noexpandtab

au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} set ft=markdown " call s:setupMarkup()
au BufNewFile,BufRead *.json set ft=javascript
au BufRead,BufNewFile *.txt call s:setupWrapping()
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79
au BufRead,BufNewFile *.scss set ft=scss
au BufRead,BufNewFile *.less set ft=less
au BufRead,BufNewFile,BufReadPost *.go set ft=go
au FileType go set noexpandtab tabstop=4 softtabstop=4 shiftwidth=4
autocmd FileType go autocmd BufWritePre <buffer> Fmt
au FileType objc set tabstop=4 softtabstop=4 shiftwidth=4

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

" Use modeline overrides
set modeline
set modelines=10

" Show (partial) command in the status line
set showcmd

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Turn off jslint errors by default
let g:JSLintHighlightErrorLine = 0


Bundle 'kien/ctrlp.vim'
Bundle 'ack.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-rails.git'
Bundle 'taq/vim-rspec.git'
Bundle 'surround.vim'
Bundle 'gmarik/snipmate.vim'
Bundle 'honza/snipmate-snippets'
Bundle 'pangloss/vim-javascript'
Bundle 'plasticboy/vim-markdown'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'ap/vim-css-color'
Bundle 'ervandew/supertab'
Bundle 'tsaleh/vim-align'
Bundle 'jgdavey/tslime.vim'
Bundle 'jgdavey/vim-turbux'
Bundle 'tpope/vim-fugitive'
Bundle 'markschabacker/cocoa.vim'
Bundle 'jnwhiteh/vim-golang.git'
Bundle 'vim-scripts/trailing-whitespace'
Bundle 'flazz/vim-colorschemes'
Bundle 'maksimr/vim-jsbeautify'
Bundle 'groenewege/vim-less'

set t_Co=256
color vexorian

nnoremap <silent> <Leader>f :Ack<space>
let g:ackprg = 'ag --nogroup --nocolor --column'

let g:cssColorVimDoNotMessMyUpdatetime = 1
let g:SuperTabMappingForward="<tab>"
let g:ctrlp_working_path_mode = 2
let g:ctrlp_dotfiles = 0
let g:ctrlp_use_caching = 1
let g:ctrlp_custom_ignore = 'vendor/ruby/\|bin/\|node_modules/\|tmp/'

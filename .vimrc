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

" vunble
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'
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
:map <leader>m :!open -a Marked.app '%:p'<CR><CR>

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
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} set ft=markdown " call s:setupMarkup()
au BufNewFile,BufRead *.{json,js} set ft=javascript
au FileType javascript set tabstop=2 softtabstop=2 shiftwidth=2
au BufRead,BufNewFile *.txt call s:setupWrapping()
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79
au BufRead,BufNewFile *.rabl set ft=ruby
au BufRead,BufNewFile *.coffee set ft=coffee
au BufRead,BufNewFile *.scss set ft=scss
au BufRead,BufNewFile *.less set ft=less
au BufRead,BufNewFile *.jade set ft=jade
au BufRead,BufNewFile,BufReadPost *.go set ft=go
au FileType go set noexpandtab tabstop=4 softtabstop=4 shiftwidth=4
autocmd FileType go autocmd BufWritePre <buffer> Fmt
au FileType objc set tabstop=4 softtabstop=4 shiftwidth=4
autocmd Filetype gitcommit setlocal spell textwidth=72

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Use modeline overrides
set modeline
set modelines=10

" Show (partial) command in the status line
set showcmd

set nobackup
" Directories for swp files
" set backupdir=~/.vim/backup
" set directory=~/.vim/backup

set t_Co=256
set background=dark

Bundle 'ag.vim'
nnoremap <silent> <Leader>f :Ag<space>
let g:agprg = 'ag --nogroup --nocolor --column'

Bundle 'kien/ctrlp.vim'
let g:ctrlp_working_path_mode = 2
let g:ctrlp_dotfiles = 0

if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
  set grepprg=ag\ --nogroup\ --nocolor
endif
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

Bundle 'scrooloose/nerdtree'
" NERDTree configuration
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$', 'tags']
map <Leader>n :NERDTreeToggle<CR>

Bundle 'scrooloose/nerdcommenter'
Bundle 'ervandew/supertab'
let g:SuperTabMappingForward="<tab>"

Bundle 'junegunn/vim-easy-align'
vnoremap <silent> <Enter> :EasyAlign<cr>

Bundle 'scrooloose/syntastic'
let g:syntastic_enable_signs=1
let g:syntastic_go_checkers=['golint']

Bundle 'vim-scripts/trailing-whitespace'
Bundle 'surround.vim'

Bundle 'tpope/vim-rails.git'
" OpenURL for rails.vim
:command -bar -nargs=1 OpenURL :!open <args>

Bundle 'kchmck/vim-coffee-script'
Bundle 'pangloss/vim-javascript'
Bundle 'maksimr/vim-jsbeautify'
Bundle 'digitaltoad/vim-jade'
Bundle 'plasticboy/vim-markdown'

Bundle 'jgdavey/vim-turbux'
let g:turbux_command_prefix = 'bundle exec'

Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-dispatch'
Bundle 'jnwhiteh/vim-golang'
Bundle 'Blackrush/vim-gocode'

Bundle 'ap/vim-css-color'
let g:cssColorVimDoNotMessMyUpdatetime = 1

Bundle 'cakebaker/scss-syntax.vim'
Bundle 'groenewege/vim-less'
Bundle 'altercation/vim-colors-solarized'
Bundle 'bling/vim-airline'
Bundle 'majutsushi/tagbar'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'terryma/vim-expand-region'

color solarized

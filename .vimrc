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

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

  Plugin 'gmarik/Vundle.vim'

  Plugin 'rking/ag.vim'
  Plugin 'kien/ctrlp.vim'
  Plugin 'jgdavey/vim-turbux'
  Plugin 'tpope/vim-dispatch'
  Plugin 'tpope/vim-fugitive'
  Plugin 'Valloric/YouCompleteMe'
  Plugin 'scrooloose/nerdcommenter'
  Plugin 'junegunn/vim-easy-align'
  Plugin 'bronson/vim-trailing-whitespace'
  Plugin 'tpope/vim-surround'
  Plugin 'tpope/vim-repeat'
  Plugin 'terryma/vim-multiple-cursors'
  Plugin 'terryma/vim-expand-region'
  Plugin 'mikewest/vimroom'
  Plugin 'rizzatti/dash.vim'

  Plugin 'tpope/vim-rails.git'
  Plugin 'AndrewRadev/splitjoin.vim'
  Plugin 'mattn/emmet-vim'
  Plugin 'kchmck/vim-coffee-script'
  Plugin 'pangloss/vim-javascript'
  "Plugin 'elzr/vim-json'
  Plugin 'maksimr/vim-jsbeautify'
  Plugin 'plasticboy/vim-markdown'
  Plugin 'slim-template/vim-slim.git'
  Plugin 'nikvdp/ejs-syntax'

  Plugin 'ap/vim-css-color'
  Plugin 'cakebaker/scss-syntax.vim'

  "Plugin 'fatih/vim-go'

  "Plugin 'ekalinin/Dockerfile.vim'

  Plugin 'altercation/vim-colors-solarized'
  Plugin 'dracula/vim'

call vundle#end()

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

" rking/ag.vim
nnoremap <silent> <Leader>f :Ag<space>
set grepprg=ag\ --vimgrep\ --nogroup\ --nocolor

if executable('ag')
  let g:ag_prg = 'ag --vimgrep --smart-case --nogroup --nocolor --column'
  let g:ag_highlight = 1
endif

nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" kien/ctrlp.vim
let g:ctrlp_working_path_mode = 2
let g:ctrlp_dotfiles = 0

if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

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

" rizzatti/dash.vim
:nmap <silent> Q <Plug>DashSearch

" mattn/emmet-vim
let g:user_emmet_settings = { 'indentation' : '  ' }

" plasticboy/vim-markdown
let g:vim_markdown_folding_disabled=1

" color solarized
color dracula

hi Visual ctermfg=NONE ctermbg=241 cterm=NONE guifg=NONE guibg=#8700af gui=NONE

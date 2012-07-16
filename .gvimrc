if has("gui_macvim")
  " Fullscreen takes up entire screen
  set fuoptions=maxhorz,maxvert

  " Automatically resize splits when resizing MacVim window
  autocmd VimResized * wincmd =

  " Command-T for CommandT
  macmenu &File.New\ Tab key=<D-T>
  map <D-t> :CommandT<CR>
  imap <D-t> <Esc>:CommandT<CR>

  " Command-Shift-F for Ack
  map <D-F> :Ack<space>

  " Command-/ to toggle comments
  map <D-/> <plug>NERDCommenterToggle<CR>
  imap <D-/> <Esc><plug>NERDCommenterToggle<CR>i
endif

if filereadable(expand("~/.nerdtree"))
  source ~/.nerdtree
endif

" Don't beep
set visualbell

" Start without the toolbar
set guioptions-=T

set guioptions=aAce
set guifont=Monaco:h13
color ashchan

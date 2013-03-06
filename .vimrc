set nocompatible

filetype plugin on

if has('gui_running')

	colorscheme mustang
	
	if has('gui_gtk')
		set guifont=Monaco
	elseif has('gui_win32')
		set guifont=Consolas:h11
	endif

	set number
	set tabstop=2
	set shiftwidth=2
	set colorcolumn=80
	set enc=utf-8

	" Moves text block
	vmap <Tab> >gV
	vmap <S-Tab> <gV

	" Map tabnext, tabprevious and tabnew like firefox
	map <C-tab> :tabnext<CR>
	map <C-S-tab> :tabprevious<CR>
	nmap <C-t> :tabnew<CR>i
	imap <C-t> <ESC>:tabnew<CR>i

	" Paste, copy, cut
	map <C-P>	"+gP
	vnoremap <C-C> "+y
	vnoremap <C-X> "+x

	" Hide the mouse when typing text
	set mousehide

	" Switch on search pattern highlighting.
	set hlsearch

	" Remove scroll bars	
	set guioptions-=L
	set guioptions-=r

	" Remove toolbar
	set guioptions-=T
	
	" Auto-open NERDTree in ebery tab 
	autocmd VimEnter * NERDTree
	autocmd BufEnter * NERDTreeMirror
	autocmd VimEnter * wincmd w	

	" Python compiler is automaticaly selected for *.py files
	autocmd BufNewFile,BufRead *.py compiler python

	" Open tag's list on the right of the screen
	let Tlist_Use_Right_Window = 1

	" Syntax on
	syntax on

	" Enable backspace on windows
	set bs=2

	" Closed tabs do not leave buffers behind
	autocmd BufRead * call s:set_hidden()
	function s:set_hidden()
		if empty(&buftype)
			setlocal bufhidden=delete
		endif
	endfunction

	" Enables folding for xml documents
	let g:xml_syntax_folding=1
	au FileType xml setlocal foldmethod=syntax

	" Always set autoindenting on
	filetype plugin indent on

	" Insert space characters whenever the tab key is pressed"
	:set expandtab

endif

set nowrap

set nobackup
set nowritebackup
set noswapfile

set incsearch

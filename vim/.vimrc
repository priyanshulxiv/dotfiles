" Leader
let mapleader =" "

" Enable line numbers and relative numbering
set number
set relativenumber

" Syntax on
syntax on

" Backspace
set backspace=indent,eol,start

" Quickly time out on keycodes, but never time out on mappings
set timeoutlen=1000
set ttimeoutlen=0

" Cursor
set guicursor=n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,sm:block

" Tabs and indentation
set noexpandtab     " Don't convert Tabs to spaces
set tabstop=4       " Width of Tab
set shiftwidth=4    " Width of Tab for (auto)indent

" Statusline
set laststatus=2    " Use a single statusline for all windows
set statusline=%<%f\ %h%m%r\ %y%=%-14.(%l,%c%V%)\ %P

" UI Settings
set signcolumn=yes  " Always show the sign column
set cursorline      " Highlight the current line
set cursorcolumn    " Highlight column
set colorcolumn=80  " Set text-width indicator
set autoindent      " Auto Indent
set smartindent     " Smart auto-indenting
set breakindent     " Wrapped lines continue visually indented
set linebreak       " Prevent line breaks in the middle of words
set ignorecase      " Case-insensitive search
set smartcase       " Case-sensitive search if uppercase letters are used
set noswapfile      " Disable swap file
set nobackup        " Disable backup files
set wrap            " Enable line wrapping
set showcmd         " Show command display
set incsearch       " Incremental search highlighting
set hlsearch        " Highlight search matches
set scrolloff=8     " Keep 8 lines visible above and below cursor
set mouse=a         " Enable mouse
set termguicolors   " Enable true colors
set noerrorbells    " Turn off bells
set novisualbell    " Turn off visual bell warning
set wildmenu        " Enable TAB completions menu on command-line mode
set wildoptions=pum " Pum completions
set pumheight=10    " Maximum height for completions

" List char
set list
set listchars=tab:>\ ,multispace:---+

" Fold
set foldcolumn=1    " Always show fold column
set foldmethod=manual
set fillchars+=foldopen:⏷,foldclose:⏵,foldsep:▏

" Search Recursively
set path=.,,**

" Netrw
let g:netrw_banner = 0                " Disable banner
let g:netrw_winsize = 25              " Set size of netrw split window
let g:netrw_localcopydircmd = "cp -r" " Copy directories recursively

" Set the undo directory and enable persistent undo
let &undodir = expand('$HOME') . "/.vim/gvim"
if !isdirectory(&undodir)
	call mkdir(&undodir, "p")
endif
set undofile

" GVIM
set guioptions-=T   " Remove GUI Toolbar

" Font specification for Windows and UNIX
if has("win32") || has("win64")
	set guifont=JetBrainsMono\ NFM:h10
elseif has("unix")
	set guifont=JetBrainsMono\ NF\ 10
endif

" Colorscheme
set background=dark
colorscheme retrobox

" Fix Background Color Erase (BCE) so colorscheme renders properly
if &term =~ '256color'
	set t_ut=
endif

" Leader keymaps
nnoremap <silent> <leader>h :nohlsearch<CR>
nnoremap <silent> <leader>w :w<CR>
nnoremap <silent> <leader>q :bp \| bd #<CR>
nnoremap <silent> <leader>lw :set wrap!<CR>
nnoremap <leader>cfp :let @+ = expand("%:p:h")<CR>:echo "Copied path to clipboard: " . expand("%:p:h")<CR>

" Remaps
nnoremap <silent> L :bnext<CR>
nnoremap <silent> H :bprevious<CR>
xnoremap J :m '>+1<CR>gv=gv
xnoremap K :m '<-2<CR>gv=gv
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z
xnoremap < <gv
xnoremap > >gv
nnoremap <expr> j v:count == 0 ? 'gj' : 'j'
nnoremap <expr> k v:count == 0 ? 'gk' : 'k'
nnoremap <silent> <Up> :resize +2<CR>
nnoremap <silent> <Down> :resize -2<CR>
nnoremap <silent> <Right> :vertical resize +2<CR>
nnoremap <silent> <Left> :vertical resize -2<CR>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>

" Extra Keymaps
nnoremap <leader>y "+y
xnoremap <leader>y "+y
nnoremap <leader>d "_d
xnoremap <leader>d "_d

" Paste from clipboard keymap for GVIM
if has("gui_running")
	inoremap <C-S-v> <C-r>+
	cnoremap <C-S-v> <C-r>+
endif

" Autocmds
augroup RemoveTrailingWhitespace
	autocmd!
	autocmd BufWritePre * let save_cursor = getpos(".")
	autocmd BufWritePre * silent! %s/\s\+$//e
	autocmd BufWritePre * call setpos(".", save_cursor)
augroup END

augroup CloseWinOnEsc
	autocmd!
	autocmd FileType help,qf call s:CloseOnEsc()
augroup END

function! s:CloseOnEsc()
	nnoremap <silent> <buffer> q :close<CR>
	nnoremap <silent> <buffer> <Esc> :close<CR>
	setlocal nobuflisted
endfunction

filetype off
set nocompatible

" vundle settings
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
"Plugin 'dag/vim2hs'
Plugin 'scrooloose/nerdtree'
call vundle#end()
filetype plugin indent on

set hidden

" airline settings
set laststatus=2
set ttimeoutlen=50
let g:airline_theme = 'powerlineish'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1

" nerdtree
map <C-n> :NERDTreeToggle<CR>

" mappings for running various files
autocmd FileType c map <C-z> :w<CR>:!clear;gcc -Wall -g % -o %:t:r -lm; ./%:t:r
autocmd FileType c map <C-x> :w<CR>:!clear;make; ./%:t:r
autocmd FileType python map <C-z> :w<CR>:!clear;python % 
autocmd FileType tex map <C-z> :w<CR>:!clear;pdflatex % %:r + ".pdf";evince %:r.pdf
autocmd FileType sh map <C-z> :w<CR>:!clear;./%
autocmd FileType matlab map <C-z> :w<Cr>:!clear;octave %

" Octave syntax
"augroup filetypedetect
"    au! BufRead,BufNewFile *.m,*.oct set filetype=octave
"augroup END

autocmd FileType make setlocal noexpandtab

" fix unindenting on comments
inoremap # X<BS>#

set mouse=a
set backspace=2
set nocompatible        
set t_Co=256
colorscheme default



" Bells
set visualbell t_vb=    " turn off error beep/flash
set novisualbell        " turn off visual bell

" Editing info
set ruler               "[same as ru] show cursor position
set showmode            "[same as smd] show when in insert mode

" Search
set hlsearch            " highlight searches
set incsearch           " do incremental searching

" clear highlighting
nnoremap <C-l> :nohl<CR><C-l>

" Auxilary files
set nobackup            " do not keep a backup file (ending in ~)
set noswapfile          " do not write a swap file

" Smart editing
set showmatch           "[same as sm] highlight matching (), {}, etc.
set wrap

" Tabs and Indenting
set number
set autoindent          "[same as ai] always set autoindenting on
set nosmartindent
set shiftwidth=4        "[same as sw] number of spaces to (auto)indent
set tabstop=4           "[same as ts] number of spaces per tab
set expandtab           "[same as et] use spaces instead of a tab
set softtabstop=4       "[same as sts] number of spaces to use instead of a tab
set smarttab            "[same as sta] <BS> deletes shiftwidth spaces from the start of a line

" Syntax highlighting
syntax on

" enable code folding
set foldmethod=indent
set foldlevel=99

" alternate between absolute and relative numbers
nmap <silent> <F2> :set relativenumber!<cr>

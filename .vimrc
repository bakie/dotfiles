syntax on                                                  " Enable syntax highlighting
set nocompatible                                           " Set nocompatible
set noerrorbells                                           " Disable beeping/flashing
set clipboard=unnamed,unnamedplus                          " Clipboard functionality (copy-paste)

set autoindent                                             " Copy indent from current line on <CR>
set belloff=all                                            " Silence terminal bell
set cursorline                                             " Highlight cursor line
" Set the cursor line (cterm) in bold with background color (ctermbg) darkblue. Optional set text color (ctermfg).
hi CursorLine cterm=bold ctermbg=darkblue
set encoding=utf-8                                         " Set character encoding
set expandtab                                              " Expand tabs to spaces
set history=1000                                           " Keep a bigger history of commands
set hlsearch                                               " Highlight search matches
set ignorecase                                             " Ignore case when searching
set incsearch                                              " Show matches when searching
set swapfile                                               " Save a swapfile
set number                                                 " Print line numbers in front of each line
set showmatch                                              " Show matching bracket
set shiftwidth=2                                           " Number of spaces to use for (auto) indent
set softtabstop=2                                          " Number of tabs that a <Tab> counts for
set smartcase                                              " Override 'ignorecase' if search has uppercase
set tabstop=2                                              " The number of spaces that a <Tab> counts for
set wildmenu                                               " Enable command-line completion
set wrap                                                   " Wrap long lines
set ttimeout                                               " Timeout key sequences
set ttimeoutlen=50                                         " Timout after 50 milliseconds
set hidden                                                 " Hide buffers when they are abandoned (prevents vim from asking to save a buffer when switching buffers)

set laststatus=2                                           " Show statusbar all the time
set statusline=                                            " Custom status line
set statusline+=%f                                         " Show file name
set statusline+=%m\                                        " Show whether file has been modified
set statusline+=%=                                         " Right align the following
set statusline+=%#CursorColumn#
set statusline+=\ %y                                       " Filetype
set statusline+=\ %{&fileencoding?&fileencoding:&encoding} " File encoding
set statusline+=\[%{&fileformat}\]                         " File format
set statusline+=\ %p%%                                     " Percentage through file
set statusline+=\ %l:%c                                    " Line number:Column number
hi CursorColumn cterm=bold ctermbg=darkblue ctermfg=white

" Make Ctrl-l clear search highlights
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Make H and L go to the begin and end of the line
nnoremap H ^
nnoremap L $

" Alias for saving when not editing as sudo
cmap w!! %!sudo tee > /dev/null %

" Enable the detection, plugin and indent
" https://vimdoc.sourceforge.net/htmldoc/filetype.html#:filetype-overview
filetype plugin indent on

" Automatically insert the matching parentheses, braces and brackets
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

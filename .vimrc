"colorscheme slate
colorscheme tokyonight
filetype on
" Send more characters for redraws
" Enable mouse use in all modes
set mouse=a
filetype plugin on
filetype indent on
syntax on
set number
   
" edit  cccccc
" abc kkkk   ssss

" Highlight cursor line underneath the cursor horizontally.
set cursorline
" sfdsfs
" Test comments
" Highlight cursor line underneath the cursor vertically.
" set cursorcolumn

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" Use space characters instead of tabs.
set expandtab

" Do not save backup files.      
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
" set nowrap
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <C-t> :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

nmap <C-o> :NERDTreeToggle<CR>
nmap <C-s> :w<CR>
nmap <C-z> :u<CR>


if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
  au InsertEnter,InsertChange *
\ if v:insertmode == 'i' | 
\   silent execute '!echo -ne "\e[6 q"' | redraw! |
\ elseif v:insertmode == 'r' |
\   silent execute '!echo -ne "\e[4 q"' | redraw! |
\ endif
au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

set omnifunc=syntaxcomplete#Complete



" Set this to the name of your terminal that supports mouse codes.

set wildmenu
" PLUGINS ---------------------------------------------------------------- {{{

call plug#begin('~/.vim/plugged')

 Plug 'preservim/nerdtree'
 Plug 'mhinz/vim-startify'

 " php specific
 Plug 'stephpy/vim-php-cs-fixer'
     
 " assuming you're using vim-plug: https://github.com/junegunn/vim-plug
 
 Plug 'ncm2/ncm2'
 Plug 'roxma/nvim-yarp'
 Plug 'ervandew/supertab'


    " NOTE: you need to install completion sources to get completions. Check
    " our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
    Plug 'ncm2/ncm2-bufword'
    Plug 'ncm2/ncm2-path'
    Plug 'pangloss/vim-javascript'
    Plug 'leafgarland/typescript-vim'
    Plug 'peitalin/vim-jsx-typescript'
    Plug 'mhartington/oceanic-next'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'sheerun/vim-polyglot'
    call plug#end()

" }}}
if &term =~ "xterm\\|rxvt"
  " use an orange cursor in insert mode
  let &t_SI = "\<Esc>]12;orange\x7"
  " use a red cursor otherwise
  let &t_EI = "\<Esc>]12;red\x7"
  silent !echo -ne "\033]12;red\007"
  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]112\007"
  " use \003]12;gray\007 for gnome-terminal and rxvt up to version 9.21
endif

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm(): "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <c-@> coc#refresh()

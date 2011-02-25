call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set nocompatible

if has("win32")
    source $VIMRUNTIME/vimrc_example.vim
    source $VIMRUNTIME/mswin.vim
    behave mswin

    set diffexpr=MyDiff()
    function! MyDiff()
        let opt = '-a --binary '
        if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
        if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
        let arg1 = v:fname_in
        if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
        let arg2 = v:fname_new
        if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
        let arg3 = v:fname_out
        if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
        let eq = ''
        if $VIMRUNTIME =~ ' '
            if &sh =~ '\<cmd'
                let cmd = '""' . $VIMRUNTIME . '\diff"'
                let eq = '"'
            else
                let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
            endif
        else
            let cmd = $VIMRUNTIME . '\diff'
        endif
        silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
    endfunction
endif

filetype plugin on
filetype plugin indent on

set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab

set autoindent

set scrolloff=3

set nobackup
set nowritebackup

if has("persistent_undo")
    "call mkdir($HOME . "/.vim/undodir")
    set undodir=~/.vim/undodir
    set undofile
endif

" uncomment to enable automatic cd-ing
"autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

set wildmenu

set mouse=a

set backspace=2

set number

set ignorecase
set smartcase

set encoding=utf-8

set incsearch
set hlsearch
" clear hl on spacebar
noremap <silent> <Space> :silent noh<CR>:pclose<CR>:NERDTreeClose<Bar>echo<CR>

if has("gui_running")
    colorscheme desert
    if has("win32")
        set guifont=DejaVu_Sans_Mono:h10
    elseif has("unix")
        set guifont="DejaVu Sans Mono 10"
    end
endif

nnoremap <silent> <C-S-Right> :tabnext<CR>
nnoremap <silent> <C-S-Left> :tabprev<CR>

nnoremap <silent> <C-t> :tabnew<CR>

nnoremap ; :
imap jj <Esc>

noremap <F1> <Esc>

" default .tex files to 'tex' rather than 'plaintex'
let g:tex_flavor='latex'

let g:indent_guides_guide_size=1

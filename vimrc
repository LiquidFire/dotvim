set nocompatible

let mapleader = ","
let maplocalleader = ","

" Vundle stuff
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
source ~/.vim/bundles.vim

filetype plugin indent on
" end of Vundle stuff

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

set laststatus=2

set number

set ignorecase
set smartcase

set encoding=utf-8

set clipboard=unnamed

set incsearch
set hlsearch
" clear hl on spacebar
noremap <silent> <Space> :silent noh<CR>:pclose<Bar>echo<CR>

if has("gui_running")
    colorscheme mustang_noi
    if has("win32")
        set guifont=DejaVu_Sans_Mono:h10
    elseif has("unix")
        set guifont="DejaVu Sans Mono 10"
    end
endif

if $COLORTERM == 'gnome-terminal'
    set t_Co=256
    colorscheme molokai
endif

if has("unix")
    let g:Powerline_symbols="unicode"
end

nnoremap <silent> <C-S-Right> :tabnext<CR>
nnoremap <silent> <C-S-Left> :tabprev<CR>
nnoremap <silent> <C-S-l> :tabnext<CR>
nnoremap <silent> <C-S-h> :tabprev<CR>

nnoremap <silent> <C-s> :w<CR>
inoremap <silent> <C-s> <Esc>:w<CR>i

"nnoremap <silent> <C-t> :tabnew<CR>

nnoremap ; :
imap jj <Esc>

noremap <F1> <Esc>
noremap <silent> <F6> :NERDTreeToggle<CR>
noremap <silent> <F8> :GundoToggle<CR>
map <F9> :set paste!<CR>
set pastetoggle=<F9>

noremap <Leader>. :CommandT<CR>


inoremap <C-j> <Esc><C-w>j
inoremap <C-k> <Esc><C-w>k
inoremap <C-l> <Esc><C-w>l
inoremap <C-h> <Esc><C-w>h

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

nnoremap <silent> <Leader>= :Tabularize /=

nnoremap <silent> <Leader>m :make<CR>
nnoremap <silent> <Leader>n :cnext<CR>
nnoremap <silent> <Leader>N :prev<CR>

" allow :W as a synonym for :w
command W :w

" default .tex files to 'tex' rather than 'plaintex'
let g:tex_flavor='latex'

let g:indent_guides_guide_size=1

" use rope omni completion instead of vim's built-in one
"autocmd FileType python set omnifunc=RopeCompleteFunc

" hide preview window automatically
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif 
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

let g:org_heading_shade_leading_stars = 0

function! s:insert_gates()
  let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
  execute "normal! i#ifndef " . gatename
  execute "normal! o#define " . gatename . " "
  execute "normal! Go#endif /* " . gatename . " */"
  normal! kk
endfunction
autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()

let g:clang_user_options='|| exit 0'
source ~/.vim/bundle/clang_complete/autoload/getopts/gcc.vim
let g:syntastic_cpp_include_dirs = [ 'Framework', 'Framework/CADIIPC', 'Framework/include' ]

let g:org_todo_keywords = [ 'TODO', 'INPROGRESS', '|', 'DONE', 'BLOCKED' ]
let g:org_todo_keyword_faces = [ [ 'BLOCKED', 'Red' ] ]

set nocompatible "Use Vim settings, rather than Vi settings
filetype off "required!

" ========== Plugin Settings =========="
"
let g:vundle_default_git_proto = 'git'
set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.

"""""""""""""
" plugin on GitHub repo
Plugin 'Shougo/vimproc.vim'

"""""""""""""
Plugin 'Shougo/unite.vim'
"call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap    [unite]   <Nop>
nmap    f [unite]

"mapping searching
nnoremap [unite]ma :<C-u>Unite mapping<CR>

"file searching 
nnoremap [unite]f  :<C-u>Unite -no-split -buffer-name=files -start-insert file_rec/async:!<cr>
"nnoremap <leader>t :Unite file_rec/async<cr> 

"content searching
"nnoremap <leader>/ :<C-u>Unite -no-split -buffer-name=files -start-insert Unite grep:.<cr> 
nnoremap [unite]/ :Unite grep:.<cr> 
" search word under Cursor
nnoremap [unite]c :UniteWithCursorWord grep:.<cr> 

"yank history 
let g:unite_source_history_yank_enable = 1
nnoremap [unite]y :Unite history/yank<cr> 

"buffer switching
nnoremap [unite]s :Unite -quick-match buffer<cr> 

"""""""""""""""
Plugin 'davidhalter/jedi-vim'
" let g:jedi#completions_enabled = 0
let g:jedi#use_tabs_not_buffers = 0

""""""""""""""""
Plugin 'scrooloose/syntastic'

""""""""""""""""
Plugin 'scrooloose/nerdcommenter'

""""""""""""""""
Plugin 'scrooloose/nerdtree'
"nnoremap <C-n> :NERDTreeToggle<cr>
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1
nnoremap <leader>f <Esc> :NERDTreeToggle<cr>

"""""""""""""""""""
Plugin 'tpope/vim-fugitive'

"""""""""""""""""""
Plugin 'altercation/vim-colors-solarized'
syntax on
set background=dark
"set background=light
"if has("gui_running")
"    let g:solarized_termcolors=256
"endif
let g:solarized_termcolors= 256 
let g:solarized_termtrans = 1 
"let g:solarized_degrade =  1 
let g:solarized_bold = 1  
"let g:solarized_underline = 1  
let g:solarized_italic = 1  
"let g:solarized_contrast = "normal"| "high" or "low" 
"let g:solarized_visibility= "normal"| "high" or "low" 
colorscheme solarized
"call togglebg#map("<F2>")


" All of your Plugins must be added before the following line
call vundle#end() " required

" ========== Vim Basic Settings ============="

"syntax on
filetype plugin indent on

set modelines=0

"TAB settings.
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" More Common Settings.
set autoread
set history=500
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5
set guifont=Monaco\ 10
set guifontwide=WenQuanYi\ Zen\ Hei\ 10

set scrolloff=3
"set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
"set visualbell
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>

"set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n\ %=[%{&ff}]\[%b][0x%B]
set cmdheight=2
set relativenumber
"set number
"set numberwidth=3

"set undofile
"set shell=/bin/bash
set lazyredraw
set matchtime=3

" use mouse everywhere
set mouse=a 
set whichwrap+=<,>,h,l  " backhspace and cursor keys wrap to
" shortens messages to avoid 'press a key' prompt
set shortmess=atI
" don't make noise
set noerrorbells

" Set title to window
set title 
" Dictionary path, from which the words are being looked up.
set dictionary=/usr/share/dict/words

" Make pasting done without any indentation break."
set pastetoggle=<F3>

" Make Vim able to edit corntab fiels again.
set backupskip=/tmp/*,/private/tmp/*"


"Settings for Searching and Moving
nnoremap / /\v
vnoremap / /\v
"nnoremap <tab> %
"vnoremap <tab> %


" Make Vim to handle long lines nicely.
set wrap
set textwidth=78
set formatoptions=tcqrn
set colorcolumn=78

" To  show special characters in Vim
"set list
set listchars=tab:▸\ ,eol:¬

" Session options
"set sessionoptions-=blank
"set sessionoptions+=resize,winpos,unix,slash
set sessionoptions=curdir,buffers,folds,resize,tabpages,unix,slash

"""" Mapping and shortcut

"Changing Leader Key
"let mapleader = ","
""""

" jk For Qicker Escaping between normal and editing mode.
inoremap jK <ESC>

" Naviagations using keys up/down/left/right
" Disabling default keys to learn the hjkl
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" Get Rid of stupid Goddamned help keys
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Map : to ; also in command mode.
"nnoremap ; :


" Naviagations windows using keys Ctrl+hjkl
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
"back to previously editing file
nmap <A-e> :e#<CR>
"bavk to previsouly viewing file
" :b#
" cycling among all opened buffers
nmap <A-n> : bnext<CR>
nmap <A-p> : bprev<CR>
"to move between the tabs with ALT+LeftArrow and ALT+RightArrow
map <silent><tab-right> :tabnext<CR>
map <silent><tab-left> :tabprevious<CR>



" Set vim to save the file on focus out.
"au FocusLost * :wa

" Leader key shortcuts.
" Leader Key provide separate namespace for specific commands.

",W Command to remove white space from a file.
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
" ,ft Fold tag, helpful for HTML editing.
nnoremap <leader>ft vatzf
" ,q Re-hardwrap Paragraph
nnoremap <leader>q gqip
" ,v Select just pasted text.
nnoremap <leader>v V`]
" ,ev Shortcut to edit .vimrc file on the fly on a vertical window.
nnoremap <leader>ev <C-w><C-s><C-l>:e $MYVIMRC<cr>
map <F7> :e $MYVIMRC<CR>
map <F6> :so $MYVIMRC<CR>


" Working with split screen nicely
" Resize Split When the window is resized"
au VimResized * :wincmd =


" Wildmenu completion "
set wildmenu
set wildmode=list:longest
set wildignore+=.hg,.git,.svn " Version Controls"
set wildignore+=*.aux,*.out,*.toc "Latex Indermediate files"
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg "Binary Imgs"
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest "Compiled Object files"
set wildignore+=*.spl "Compiled speolling world list"
set wildignore+=*.sw? "Vim swap files"
set wildignore+=*.DS_Store "OSX SHIT"
set wildignore+=*.luac "Lua byte code"
set wildignore+=migrations "Django migrations"
set wildignore+=*.pyc "Python Object codes"
set wildignore+=*.orig "Merge resolution files"

"Make Sure that Vim returns to the same line when we reopen a file"
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \ execute 'normal! g`"zvzz' |
        \ endif
augroup END

nnoremap g; g;zz

" =========== END Basic Vim Settings ===========


" =========== Gvim Settings =============

" Removing scrollbars
if has("gui_running")
    set guitablabel=%-0.12t%M
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    set guioptions+=a
    set guioptions-=m
    "colo badwolf
    set listchars=tab:▸\ ,eol:¬       " Invisibles using the Textmate style
else
    set t_Co=256
    "colorschem badwolf
endif



" Special Settings for Consoles
"if !has("gui_running")
"    set t_Co=256
"    colorschem badwolf
"endif

" Source the vimrc file after saving it
"autocmd bufwritepost .vimrc source ~/.vimrc

" ========== END Gvim Settings ==========


" ========== Python Settings =========="
"
" Python Settings
"au FileType python setlocal indent on
au FileType python setlocal nowrap
au FileType python setlocal cursorcolumn 
au FileType python setlocal go -=m |setlocal go-=T
au FileType python setlocal cursorcolumn 
au FileType python setlocal go -=r |setlocal go-=b 
"au FileType python setlocal go -=r |setlocal go-=b |setlocal lines=99
au FileType python setlocal textwidth=79

"enable code folding, type 'za' inside a method to poen and close a fold
set foldmethod=indent
set foldlevel=99

" Scratch settings
"nmap <A-s> :Scratch<CR>
"nmap <leader>s <Esc>:Scratch<CR>


" Gundo key bindings.
"nnoremap <leader>u <ESC> :GundoToggle<CR>

" pep8 key bindings.
"let g:pep8_map='<leader>8'


"use vim settings instead of vi
if &compatible
    set nocompatible
endif
"color scheme
colors dave
set background=dark
set scrolloff=2
set showmatch
set showmode
set showcmd
set ruler
set title
set wildmenu
set wildignore=*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,.svn
set laststatus=2
set matchtime=2
set matchpairs+=<:>
"editor settings
set esckeys
set ignorecase
set smartcase
set smarttab
set magic
set bs=indent,eol,start
set tabstop=4
set shiftwidth=4
set expandtab
set fileformat=unix
"system settings
set lazyredraw
set confirm
set nobackup
set viminfo='20,\"500,:20,%,n~/.viminfo
set hidden
set history=50
set mouse=v
set foldmethod=indent
set foldnestmax=2
set foldminlines=8
nnoremap <space> za
vnoremap <space> zf
highlight RedundantWhitespace ctermbg=red guibg=red
match RedundantWhitespace /\s\+$/
highlight HardTabs ctermbg=red guibg=red
match HardTabs /\t/
match Error /\s\+$\|\t/
set wildmode=longest,list,full
"color settings (if supported)
if &t_Co > 2 || has("gui_running")
    syntax on
endif
set nohlsearch
set incsearch
"jj exit insert mode
inoremap jj <Esc>
nnoremap JJJJ <Nop>
"slimux bindings
map <C-c><C-c> :SlimuxREPLSendLine<CR>
vmap <C-c><C-c> :SlimuxREPLSendSelection<CR>
"clipboard
let g:clipbrdDefaultReg = '+'
"close a tab, remove buffer
set nohidden
highlight MatchParen ctermbg=4
"paste mode toggle
map <F10> :set paste<CR>
map <F11> :set nopaste<CR>
imap <F10> <C-O>:set paste<CR>
imap <F11> <nop>
set pastetoggle=<F11>
filetype plugin indent on
if has("autocmd")
    let bash_is_sh=1
    "change to directory of current file automatically
    autocmd BufEnter * lcd %:p:h
    augroup mysettings
        au FileType xsit,xml,css,html,xhtml,javascript,sh,config,c,cpp,docbook set smartindent shiftwidth=3 softtabstop=2 expandtab
        au FileType tex set wrap shiftwidth=2 softtabstop=2 expandtab
        au FileType python set tabstop=4 softtabstop=4 expandtab shiftwidth=4 cinwords=if,elif,else,for,while,try,except,finally,def,class
    augroup END
    autocmd BufReadPost *
                \ if line("'\''") > 0 && line("'\''") <= line("$") |
                \   exe "normal g'\''" |
                \ endif
    " restore cursor to previous position on file open
    function! ResCur()
        if line("'\"") <= line("$")
            normal! g`"
            return 1
        endif
    endfunction
    augroup resCur
        autocmd!
        autocmd BufWinEnter * call ResCur()
    augroup END
    autocmd FileType * let b:comment = "#"
    autocmd FileType asm let b:comment = ";"
    autocmd FileType nasm let b:comment = ";"
    autocmd FileType vim let b:comment = "\""
    autocmd FileType c let b:comment = "\/\/"
    autocmd FileType cc let b:comment = "\/\/"
    autocmd FileType cpp let b:comment = "\/\/"
    "block commenting; - to comment, _ to uncomment
    nmap <expr> - AddComment()
    nmap <expr> _ RemoveComment()
    vmap <expr> - AddComment()
    vmap <expr> _ RemoveComment()
    func AddComment()
        return ':s/^\(\s*\)/\1' . b:comment . "/\r:nohl\r"
    endfunc
    func RemoveComment()
        return ':s/^\(\s*\)' . b:comment . "/\\1/\r:nohl\r"
    endfunc
endif
map Q gq
set shiftround

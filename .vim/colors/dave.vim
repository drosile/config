hi clear
set background=dark
if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "dave"
"if &t_Co != 256 || has('gui_running')
"    echoe 'the ' . g:colors_name . ' color scheme requires a 256-color terminal'
"    finish
"endif
hi xmlTag ctermfg=149 ctermbg=none cterm=bold
hi xmlTagName ctermfg=250 ctermbg=none
hi xmlEndTag ctermfg=209 ctermbg=none cterm=bold
hi Normal ctermfg=231 ctermbg=none guifg=#ffffff guibg=#000000
hi Visual ctermfg=none ctermbg=239
hi CursorLine ctermfg=231 ctermbg=237
hi CursorColumn ctermfg=231 ctermbg=237
hi Folded ctermfg=249 ctermbg=234
hi FoldColumn ctermfg=243 ctermbg=234
hi SignColumn ctermfg=231 ctermbg=233 cterm=bold
hi Colorcolumn ctermfg=none ctermbg=235
hi LineNr ctermfg=243 ctermbg=231
hi VertSplit ctermfg=240 ctermbg=234
hi WildMenu ctermfg=234 ctermbg=231
hi Directory ctermfg=143 ctermbg=none cterm=bold
hi Underlined ctermfg=130 ctermbg=none
hi Question ctermfg=74 ctermbg=none cterm=bold
hi MoreMsg ctermfg=214 ctermbg=none cterm=bold
hi WarningMsg ctermfg=202 ctermbg=none cterm=bold
hi ErrorMsg ctermfg=196 ctermbg=none cterm=bold
hi Comment ctermfg=243 ctermbg=233 guifg=#808080
hi TabLine ctermfg=231 ctermbg=238
hi TabLineSel ctermfg=255 ctermbg=none cterm=bold
hi TabLineFill ctermfg=240 ctermbg=238
hi TabLineNumber ctermfg=160 ctermbg=238 cterm=bold
hi TabLineClose ctermfg=245 ctermbg=238 cterm=bold
hi SpecialKey ctermfg=239 ctermbg=none
hi NonText ctermfg=88 ctermbg=none
hi MatchParen ctermfg=196 ctermbg=88 cterm=bold
hi Constant ctermfg=137 cterm=bold guifg=#00ffff gui=none
hi Special ctermfg=150 ctermbg=none guifg=#0000ff
hi Identifier ctermfg=66 ctermbg=none cterm=bold guifg=#00c0c0
hi Statement ctermfg=186 ctermbg=none cterm=bold guifg=#c0c000 gui=bold
hi PreProc ctermfg=144 ctermbg=none guifg=#00ff00
hi Type ctermfg=67 ctermbg=none cterm=bold guifg=#00c000
hi String ctermfg=143 ctermbg=none
hi Number ctermfg=173 ctermbg=none
hi Define ctermfg=173 ctermbg=none
hi Error ctermfg=208 ctermbg=124 guibg=#ff0000
hi Function ctermfg=221 ctermbg=none
hi Include ctermfg=173 ctermbg=none
hi PreCondit ctermfg=173 ctermbg=none
hi Keyword ctermfg=173 ctermbg=none
hi Search ctermfg=16 ctermbg=227 cterm=underline,bold
hi Title ctermfg=15 ctermbg=none
hi TODO ctermfg=228 ctermbg=94 cterm=bold
hi StatusLine ctermfg=202 ctermbg=none cterm=none guifg=#ffff00 guibg=#0000ff gui=none

hi link htmlTag xmlTag
hi link htmlTagName xmlTagName
hi link htmlEndTag xmlEndTag

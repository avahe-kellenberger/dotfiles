"Maintainer:    Greg Sexton <gregsexton@gmail.com>
"Last Change:   2012-08-04
"Version:       1.0
"URL:           http://www.gregsexton.org/vim-color-schemes/muon/

set background=dark
if version > 580
    "no guarantees for version 5.8 and below, but this makes it stop complaining
    hi clear
    if exists("syntax_on")
    syntax reset
    endif
endif
let g:colors_name="muon-transparent"

hi Normal       ctermfg=250                              gui=None        guifg=#bcbcbc       
hi LineNr       ctermfg=239                              gui=None        guifg=#4e4e4e       
hi NonText      ctermfg=234                              gui=None        guifg=#1c1c1c       

hi VertSplit    ctermfg=237  cterm=none                  gui=None        guifg=#3a3a3a       
hi StatusLine   ctermfg=249  cterm=underline             gui=underline   guifg=#b2b2b2       
hi StatusLineNC ctermfg=243  cterm=none                  gui=None        guifg=#767676       

hi DiffDelete   ctermfg=234                              gui=None        guifg=#1c1c1c       
hi DiffAdd                                               gui=None        
hi DiffChange                                            gui=None        
hi DiffText     ctermfg=161  cterm=underline             gui=underline   guifg=#df005f       

hi Cursor       ctermfg=234                              gui=None        guifg=#1c1c1c       

hi Visual       ctermfg=234                              gui=None        guifg=#1c1c1c       

hi Folded       ctermfg=016  ctermbg=023                 gui=None        guifg=#808080       
hi FoldColumn   ctermfg=244                              gui=None        guifg=#808080       

hi IncSearch    ctermfg=234  cterm=underline             gui=underline   guifg=#1c1c1c       
hi Search       ctermfg=234  cterm=none                  gui=None        guifg=#1c1c1c       

hi ModeMsg      ctermfg=117  cterm=bold                  gui=bold        guifg=#87dfff       
hi MoreMsg      ctermfg=122  cterm=none                  gui=None        guifg=#87ffdf       
hi Question     ctermfg=122  cterm=bold                  gui=bold        guifg=#87ffdf       
hi WarningMsg   ctermfg=122  cterm=none                  gui=None        guifg=#87ffdf       
hi ErrorMsg     ctermfg=255  cterm=none                  gui=None        guifg=#eeeeee       
hi Error        ctermfg=196  cterm=none                  gui=None        guifg=#ff0000       

hi SpecialKey   ctermfg=214                              gui=None        guifg=#ffaf00       
hi Title        ctermfg=075  cterm=bold                  gui=bold        guifg=#5fafff       
hi Directory    ctermfg=117  cterm=bold                  gui=bold        guifg=#87dfff       

hi SignColumn   ctermfg=214                              gui=None        guifg=#ffaf00       

hi WildMenu     ctermfg=075  cterm=bold                  gui=bold        guifg=#5fafff       

if version >= 700 " Vim 7.x specific colors
    hi CursorLine    cterm=none                          gui=None        
    hi CursorColumn  cterm=none                          gui=None        

    hi MatchParen   ctermfg=196  cterm=bold,reverse      gui=bold,reverse    guifg=#ff0000       

    hi Tabline      ctermfg=245  cterm=underline         gui=underline   guifg=#8a8a8a       
    hi TablineSel   ctermfg=250  cterm=bold              gui=bold        guifg=#bcbcbc       
    hi TablineFill  ctermfg=250  cterm=underline         gui=underline   guifg=#bcbcbc       

    hi Pmenu        ctermfg=250  cterm=none              gui=None        guifg=#bcbcbc       
    hi PmenuSel     ctermfg=117  cterm=underline         gui=underline   guifg=#87dfff       
    hi PmenuSbar    ctermfg=116  cterm=none              gui=None        guifg=#87dfdf       
    hi PmenuThumb   ctermfg=116  cterm=none              gui=None        guifg=#87dfdf       

    hi SpellBad     ctermfg=198  cterm=underline         gui=underline   guifg=#ff0087       
    hi SpellCap     ctermfg=198  cterm=none              gui=None        guifg=#ff0087       
    hi SpellRare    ctermfg=198  cterm=none              gui=None        guifg=#ff0087       
    hi SpellLocal   ctermfg=198  cterm=none              gui=None        guifg=#ff0087       
endif

if version >= 703 " Vim 7.3 specific colors
    hi ColorColumn                                       gui=None        
endif

" syntax highlighting groups
hi Comment    ctermfg=240                                gui=None        guifg=#585858       
hi Constant   ctermfg=086                                gui=None        guifg=#5fffdf       
hi Identifier ctermfg=080  cterm=bold                    gui=bold        guifg=#5fdfdf       
hi String     ctermfg=074                                gui=None        guifg=#5fafdf       
hi Statement  ctermfg=159  cterm=none                    gui=None        guifg=#afffff       
hi PreProc    ctermfg=122                                gui=None        guifg=#87ffdf       
hi Function   ctermfg=121  cterm=bold                    gui=bold        guifg=#87ffaf       
hi Type       ctermfg=117  cterm=bold                    gui=bold        guifg=#87dfff       
hi Special    ctermfg=050                                gui=None        guifg=#00ffdf       
hi Delimiter  ctermfg=153                                gui=None        guifg=#afdfff       
hi Number     ctermfg=086                                gui=None        guifg=#5fffdf       
hi Ignore     ctermfg=214                                gui=None        guifg=#ffaf00       
hi Todo       ctermfg=196                                gui=None        guifg=#ff0000       
hi Exception  ctermfg=080  cterm=bold                    gui=bold        guifg=#5fdfdf       

"vim: sw=4
hi NonText none
hi Normal guibg=NONE NONE

" Refresh before loading this theme
hi clear
if exists("syntax_on")
  syntax reset
endif

" Highlighting functions {{{
fun <sid>hi(group, guifg, guibg, ctermfg, ctermbg, attr)
  if a:guifg != ""
    exec "hi " . a:group . " guifg=" . s:gui(a:guifg)
  endif
  if a:guibg != ""
    exec "hi " . a:group . " guibg=" . s:gui(a:guibg)
  endif
  if a:ctermfg != ""
    exec "hi " . a:group . " ctermfg=" . s:cterm(a:ctermfg)
  endif
  if a:ctermbg != ""
    exec "hi " . a:group . " ctermbg=" . s:cterm(a:ctermbg)
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
  endif
endfun

fun s:gui(colour)
  if &background == "dark"
    return a:colour
  endif

  if a:colour == s:gui00
    return s:gui01
  elseif a:colour == s:gui01
    return s:gui00
  elseif a:colour == s:gui02
    return s:gui03
  elseif a:colour == s:gui04
    return s:gui05
  elseif a:colour == s:gui06
    return s:gui07
  elseif a:colour == s:gui08
    return s:gui09
  elseif a:colour == s:gui10
    return s:gui11
  elseif a:colour == s:gui12
    return s:gui13
  elseif a:colour == s:gui14
    return s:gui15
  elseif a:colour == s:gui16
    return s:gui17
  elseif a:colour == s:gui18
    return s:gui19
  elseif a:colour == s:gui20
    return s:gui21
  endif

  return a:colour
endfun

function s:cterm(colour)
  " Return same value when dark
  if &background == "dark"
    return a:colour
  endif

  if a:colour == s:cterm00
    return s:cterm01
  elseif a:colour == s:cterm01
    return s:cterm00
  elseif a:colour == s:cterm02
    return s:cterm03
  elseif a:colour == s:cterm04
    return s:cterm05
  elseif a:colour == s:cterm06
    return s:cterm07
  elseif a:colour == s:cterm08
    return s:cterm09
  elseif a:colour == s:cterm10
    return s:cterm11
  elseif a:colour == s:cterm12
    return s:cterm13
  elseif a:colour == s:cterm14
    return s:cterm15
  elseif a:colour == s:cterm16
    return s:cterm17
  elseif a:colour == s:cterm18
    return s:cterm19
  elseif a:colour == s:cterm20
    return s:cterm21
  endif

  return a:colour
endfunction
" }}}
" Colour definitions {{{

" Background colour (dark), text colour (light)
let s:cterm00 = "08"
let s:gui00 = "#1D1E1A"
" Background colour (light), text colour (dark)
let s:cterm01 = "07"
let s:gui01 = "#EEEEEE"
" (Dark) Greyed out bg (NCstatus, nu)
let s:cterm02 = "59"
let s:gui02 = "#5f5f5f"
" (Light) NCstatus, nu
let s:cterm03 = "247"
let s:gui03 = "#5f5f5f"
" (Dark) Cursorline
let s:cterm04 = "236"
let s:gui04 = "#303030"
" (Light) Cursorline
let s:cterm05 = "254"
let s:gui05 = "#5f5f5f"
" (Dark) CursorlineNr
let s:cterm06 = "219"
let s:gui06 = "#ffafff"
" (Light) CursorlineNr
let s:cterm07 = "9"
let s:gui07 = "#ffafff"
" (Dark) String colour
let s:cterm08 = "228"
let s:gui08 = "#fff87"
" (Light) String colour
let s:cterm09 = "88"
let s:gui09 = "#fff87"
" (Dark) Statusline
let s:cterm10 = "10"
let s:gui10 = "#88D400"
" (Light) Statusline
let s:cterm11 = "22"
let s:gui11 = "#FFD400"
" (Dark) Folded, Type & Special
let s:cterm12 = "51"
let s:gui12 = "#00ffff"
" (Light) Folded, Type & Special
let s:cterm13 = "26"
let s:gui13 = "#00ffff"
" (Dark) Conditionals, Statements & Warnings
let s:cterm14 = "198"
let s:gui14 = "#ff0087"
" (Light) Conditionals, Statements & Warnings
let s:cterm15 = "52"
let s:gui15 = "#ff0087"
" (Dark) Function names
let s:cterm16 = "02"
let s:gui16 = "#88d400"
" (Light) Function names
let s:cterm17 = "22"
let s:gui17 = "#ff0087"
" (Dark) Identifier names
let s:cterm18 = "214"
let s:gui18 = "#ffaf00"
" (Light) Identifier names
let s:cterm19 = "125"
let s:gui19 = "#ffaf00"
" (Dark) Booleans & Constants
let s:cterm20 = "141"
let s:gui20 = "#af87ff"
" (Light) Booleans & Constants
let s:cterm21 = "202"
let s:gui21 = "#af87ff"

" }}}

" Status bar
" call <sid>hi("User1", s:gui10, "", s:cterm10, "", "")
" set stl=--\ %1*%F%m%r%h%w%*\ %=\ %y\ -\ [%l,%c]\ [%L,%p%%] laststatus=2 showtabline=1 tags=./.tags;
set fillchars=stlnc:\-,stl:\-,vert:\|

" UI components {{{
call <sid>hi("Normal", s:gui01, s:gui00, s:cterm01, s:cterm00, "")
hi ColorColumn ctermbg=234 guibg=#121212
call <sid>hi("CursorLine", "", "", "", s:cterm04, "NONE")
call <sid>hi("CursorLine", "", s:gui04, "", s:cterm04, "NONE")
call <sid>hi("CursorLineNr", s:gui06, s:gui04, s:cterm06, s:cterm04, "")
call <sid>hi("LineNr", s:gui02, s:gui01, s:cterm02, s:cterm00, "")
hi Search ctermbg=52 ctermfg=NONE guibg=#878787 guifg=NONE
hi Visual ctermbg=52 ctermfg=NONE guibg=#878787 guifg=NONE
call <sid>hi("ErrorMsg", s:gui14, "NONE", s:cterm14, "NONE", "")
call <sid>hi("MatchParen", s:gui10, "NONE", s:cterm14, "NONE", "")
hi Comment ctermfg=102 guifg=#878787
call <sid>hi("Folded", s:gui10, "NONE", s:cterm10, "NONE", "")
call <sid>hi("VertSplit", s:gui00, s:gui02, s:cterm00, s:cterm02, "")

" Tab number
hi Title ctermfg=150 guifg=#afd787
call <sid>hi("StatusLine", s:gui01, s:gui00, s:cterm00, s:cterm01, "")
call <sid>hi("StatusLineNC", s:gui00, s:gui02, s:cterm00, s:cterm02, "")

" Tab bar (background)
hi TabLineFill ctermfg=236 guifg=#303030
" Tab bar (active)
hi TabLineSel ctermfg=7 ctermbg=237 guifg=#EEEEEE guibg=#3a3a3a
hi TabLine ctermfg=59 ctermbg=236 guifg=#5f5f5f guibg=#303030
" }}}
" Text {{{
"
" Color the ~ characters beyond EOF and listchars
hi NonText ctermfg=102 guifg=#878787
hi Todo ctermfg=194 ctermbg=NONE guifg=#d7ffd7
call <sid>hi("Number", s:gui01, "", s:cterm01, "", "")
call <sid>hi("Float", s:gui01, "", s:cterm01, "", "")
call <sid>hi("Boolean", s:gui20, "", s:cterm20, "", "")
call <sid>hi("Constant", s:gui20, "", s:cterm20, "", "")
call <sid>hi("Conditional", s:gui14, "NONE", s:cterm14, "NONE", "")
call <sid>hi("String", s:gui08, "", s:cterm08, "", "")
call <sid>hi("Identifier", s:gui18, "", s:cterm18, "", "bold")
call <sid>hi("PMenu", "", s:gui01, "", s:cterm01, "")
call <sid>hi("PMenuSel", "", s:gui00, "", s:cterm00, "")
call <sid>hi("SignColumn", "", s:gui00, "", s:cterm00, "")
hi SyntasticErrorSign ctermfg=201 ctermbg=8 guifg=#ff00ff guibg=#1D1E1A
hi SyntasticWarningSign ctermfg=100 ctermbg=8 guifg=#878700 guibg=#1D1E1A
" hi SpellBad ctermbg=88 ctermfg=140
" hi SpellCap ctermbg=47 ctermfg=200
call <sid>hi("Preproc", s:gui14, "NONE", s:cterm14, "NONE", "")
call <sid>hi("Type", s:gui12, "", s:cterm12, "", "")
call <sid>hi("Special", s:gui12, "", s:cterm12, "", "")

" Used for ruby method names
call <sid>hi("Function", s:gui16, "NONE", s:cterm16, "NONE", "")

" Statement - hi/call in vimscript, ruby class end/lambda
call <sid>hi("Statement", s:gui14, "NONE", s:cterm14, "NONE", "")
call <sid>hi("rubyClass", s:gui14, "NONE", s:cterm14, "NONE", "")

" Press ENTER or type to continue
hi Question ctermfg=87 ctermbg=8
call <sid>hi("WarningMsg", s:gui14, "NONE", s:cterm14, "NONE", "")
" }}}
" Variable cleandown {{{

" Remove color definitions
unlet s:cterm00 s:cterm01 s:cterm02 s:cterm03 s:cterm04 s:cterm05
unlet s:cterm06 s:cterm07 s:cterm08 s:cterm09 s:cterm10 s:cterm11

" Remove functions
delf <sid>hi
delf <sid>gui
delf <sid>cterm

" }}}

" }}}

" Required if theme/background gets changed
let g:colors_name = 'evelyn'

" Toggle Background {{{

if exists('g:loaded_evelyn')
  finish
endif

let g:loaded_evelyn = 1

function ToggleBackground()
  let &background = ( &background == "dark"? "light" : "dark" )
  if exists("g:colors_name")
    exe "colorscheme " . g:colors_name
  endif
endfunction

map <f5> :silent call ToggleBackground()<CR>


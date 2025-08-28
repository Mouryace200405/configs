 

" miasma_enhanced.vim - Warm and vibrant custom colorscheme

if exists("syntax_on")
  syntax reset
endif
set background=dark
let g:colors_name = "miasma_enhanced"

" Define colors
let s:bg_dark = "#1a1a1a"
let s:bg_main = "#242424"
let s:bg_light = "#2a2a2a"
let s:bg_lighter = "#343434"
let s:fg_main = "#e4d5a7"
let s:fg_dim = "#c9b894"
let s:fg_dimmer = "#888888"
let s:fg_comment = "#777777"
let s:orange_warm = "#d4935c"
let s:orange_bright = "#e6a76b"
let s:yellow_warm = "#e0c088"
let s:yellow_bright = "#f0d49a"
let s:green_warm = "#7a9070"
let s:green_bright = "#8ba082"
let s:red_warm = "#c77d5c"
let s:red_bright = "#d48b6a"
let s:brown_warm = "#8b6f47"
let s:brown_bright = "#a0825a"

" Core interface highlights
hi Normal guifg=s:fg_main guibg=s:bg_main
hi NonText guifg=s:fg_comment guibg=NONE gui=bold
hi Comment guifg=s:fg_comment guibg=NONE gui=italic
hi Cursor guifg=s:bg_main guibg=s:yellow_warm
hi CursorLine guibg=s:bg_light
hi CursorColumn guibg=s:bg_light
hi CursorLineNr guifg=s:yellow_warm guibg=s:bg_light gui=bold
hi LineNr guifg=s:fg_dimmer guibg=s:bg_light
hi Visual guifg=s:bg_main guibg=s:green_warm
hi Search guifg=s:bg_main guibg=s:yellow_bright gui=bold
hi IncSearch guifg=s:bg_main guibg=s:orange_bright gui=bold

" Syntax highlights
hi Boolean guifg=s:green_bright
hi Constant guifg=s:orange_warm
hi String guifg=s:brown_warm
hi Number guifg=s:green_warm gui=bold
hi Identifier guifg=s:fg_main
hi Function guifg=s:green_bright gui=bold
hi Statement guifg=s:green_warm gui=bold
hi Keyword guifg=s:green_warm gui=bold
hi Type guifg=s:green_bright gui=bold
hi Special guifg=s:orange_bright
hi Delimiter guifg=s:yellow_warm

" Status line and UI
hi StatusLine guifg=s:fg_main guibg=s:bg_lighter gui=bold
hi StatusLineNC guifg=s:fg_dimmer guibg=s:bg_lighter
hi VertSplit guifg=s:bg_lighter guibg=s:bg_main
hi WinSeparator guifg=s:bg_lighter

" Tab line
hi TabLine guifg=s:fg_dimmer guibg=s:bg_dark
hi TabLineSel guifg=s:bg_dark guibg=s:green_bright gui=bold
hi TabLineFill guifg=s:yellow_warm guibg=s:bg_main

" Popup menu
hi Pmenu guifg=s:fg_main guibg=s:bg_light
hi PmenuSel guifg=s:bg_main guibg=s:green_bright gui=bold
hi PmenuSbar guibg=s:fg_dimmer
hi PmenuThumb guifg=s:fg_main guibg=s:fg_main

" Errors and diagnostics
hi Error guifg=s:fg_main guibg=s:red_warm gui=bold
hi ErrorMsg guifg=s:red_bright guibg=s:bg_main gui=bold
hi WarningMsg guifg=s:orange_bright gui=bold
hi DiagnosticError guifg=s:red_warm
hi DiagnosticWarn guifg=s:brown_warm
hi DiagnosticInfo guifg=s:green_warm
hi DiagnosticHint guifg=s:green_warm

" Git integration
hi DiffAdd guifg=s:bg_main guibg=s:green_warm
hi DiffChange guifg=s:bg_main guibg=s:brown_warm
hi DiffDelete guifg=s:bg_main guibg=s:red_warm gui=bold
hi DiffText guifg=s:bg_main guibg=s:yellow_bright gui=bold

" Special UI elements
hi MatchParen guifg=s:yellow_bright gui=bold,underline
hi Directory guifg=s:green_warm guibg=s:bg_light gui=bold
hi Title guifg=s:orange_bright gui=bold
hi Todo guifg=s:yellow_bright gui=bold,underline

" Folding and spell checking
hi Folded guifg=s:orange_warm guibg=s:bg_light gui=italic
hi FoldColumn guifg=s:fg_dimmer guibg=s:bg_light
hi SpellBad guifg=s:red_bright guisp=s:red_warm gui=underline
hi SpellCap guifg=s:green_warm guisp=s:green_warm gui=underline
hi SpellLocal guifg=s:orange_bright guisp=s:orange_warm gui=underline
hi SpellRare guifg=s:red_warm guisp=s:red_warm gui=underline

" Terminal colors
hi TermCursor gui=reverse

" Additional UI
hi ColorColumn guibg=s:bg_lighter
hi SignColumn guifg=s:fg_dimmer guibg=s:bg_light





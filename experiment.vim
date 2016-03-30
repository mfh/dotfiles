" Experiment Colorscheme Configuration (update: 30/03/2016)

hi clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "experiment"

hi Normal       gui=NONE      guifg=Ivory          guibg=Black         cterm=NONE      ctermfg=231        ctermbg=NONE
hi SignColumn   gui=NONE      guifg=Cyan           guibg=bg            cterm=NONE      ctermfg=51         ctermbg=NONE
hi SpellBad     gui=undercurl guifg=NONE           guisp=Red           cterm=underline ctermfg=NONE       ctermbg=196
hi SpellCap     gui=undercurl guifg=NONE           guisp=Blue          cterm=underline ctermfg=NONE       ctermbg=21
hi SpellRare    gui=undercurl guifg=NONE           guisp=Magenta       cterm=underline ctermfg=NONE       ctermbg=201
hi SpellLocal   gui=undercurl guifg=NONE           guisp=Cyan          cterm=underline ctermfg=NONE       ctermbg=51
hi Pmenu        gui=NONE      guifg=NONE           guibg=Magenta       cterm=NONE      ctermfg=NONE       ctermbg=201
hi PmenuSel     gui=NONE      guifg=NONE           guibg=DarkGrey      cterm=NONE      ctermfg=NONE       ctermbg=248
hi PmenuSbar    gui=NONE      guifg=NONE           guibg=Grey          cterm=NONE      ctermfg=NONE       ctermbg=250
hi PmenuThumb   gui=reverse   guifg=NONE           guibg=NONE          cterm=reverse   ctermfg=NONE       ctermbg=NONE
hi CursorColumn gui=NONE      guifg=NONE           guibg=Grey40        cterm=NONE      ctermfg=NONE       ctermbg=237
hi CursorLine   gui=NONE      guifg=NONE           guibg=Grey40        cterm=NONE      ctermfg=NONE       ctermbg=237
hi MatchParen   gui=NONE      guifg=NONE           guibg=DarkCyan      cterm=NONE      ctermfg=NONE       ctermbg=30
hi TabLineFill  gui=NONE      guifg=Grey21         guibg=Grey21        cterm=NONE      ctermfg=236        ctermbg=236
hi TabLine      gui=NONE      guifg=MistyRose3     guibg=Grey21        cterm=NONE      ctermfg=181        ctermbg=236
hi TabLineSel   gui=NONE      guifg=LightBlue3     guibg=Grey21        cterm=NONE      ctermfg=110        ctermbg=236
hi ErrorMsg     gui=NONE      guifg=Red            guibg=Linen         cterm=NONE      ctermfg=196        ctermbg=NONE
hi IncSearch    gui=NONE      guifg=Black          guibg=LightGreen    cterm=NONE      ctermfg=Black      ctermbg=LightGreen
hi ModeMsg      gui=NONE      guifg=fg             guibg=bg            cterm=NONE      ctermfg=fg         ctermbg=NONE
hi StatusLine   gui=NONE      guifg=LightBlue3     guibg=Grey21        cterm=NONE      ctermfg=110        ctermbg=236
hi StatusLineNC gui=NONE      guifg=MistyRose3     guibg=Grey21        cterm=NONE      ctermfg=181        ctermbg=236
hi VertSplit    gui=NONE      guifg=LightBlue4     guibg=Black         cterm=NONE      ctermfg=66         ctermbg=NONE
hi Visual       gui=reverse   guifg=LightBlue4     guibg=Black         cterm=reverse   ctermfg=66         ctermbg=16
hi VisualNOS    gui=underline guifg=fg             guibg=bg            cterm=underline ctermfg=fg         ctermbg=NONE
hi DiffText     gui=NONE      guifg=Yellow         guibg=LightSkyBlue4 cterm=NONE      ctermfg=226        ctermbg=66
hi Cursor       gui=NONE      guibg=Lavender       guifg=Black         cterm=NONE      ctermfg=16         ctermbg=255
hi LCursor      gui=NONE      guibg=Lavender       guifg=Black         cterm=NONE      ctermfg=16         ctermbg=255
hi Directory    gui=NONE      guifg=LightGreen     guibg=bg            cterm=NONE      ctermfg=120        ctermbg=NONE
hi LineNr       gui=NONE      guifg=LightGrey      guibg=bg            cterm=NONE      ctermfg=LightGrey  ctermbg=NONE
hi MoreMsg      gui=NONE      guifg=SeaGreen       guibg=bg            cterm=NONE      ctermfg=29         ctermbg=NONE
hi NonText      gui=NONE      guifg=Cyan4          guibg=Black         cterm=NONE      ctermfg=30         ctermbg=NONE
hi Question     gui=NONE      guifg=LimeGreen      guibg=bg            cterm=NONE      ctermfg=77         ctermbg=NONE
hi Search       gui=NONE      guifg=Black          guibg=LightGreen    cterm=underline ctermfg=LightGreen ctermbg=NONE
hi SpecialKey   gui=NONE      guifg=Cyan           guibg=bg            cterm=NONE      ctermfg=51         ctermbg=NONE
hi Title        gui=NONE      guifg=Yellow2        guibg=bg            cterm=NONE      ctermfg=226        ctermbg=NONE
hi WarningMsg   gui=NONE      guifg=Tomato3        guibg=Black         cterm=NONE      ctermfg=167        ctermbg=NONE
hi WildMenu     gui=NONE      guifg=Black          guibg=SkyBlue4      cterm=NONE      ctermfg=16         ctermbg=60
hi Folded       gui=NONE      guifg=LightPink      guibg=bg            cterm=NONE      ctermfg=217        ctermbg=NONE
hi FoldColumn   gui=NONE      guifg=DarkBlue       guibg=Grey          cterm=NONE      ctermfg=18         ctermbg=250
hi DiffText     gui=bold      guifg=NONE           guibg=Red           cterm=bold      ctermfg=NONE       ctermbg=196
hi DiffAdd      gui=NONE      guifg=Blue           guibg=LightCyan     cterm=NONE      ctermfg=21         ctermbg=195
hi DiffChange   gui=NONE      guifg=White          guibg=LightCyan4    cterm=NONE      ctermfg=231        ctermbg=102
hi DiffDelete   gui=NONE      guifg=LightBlue      guibg=LightCyan     cterm=NONE      ctermfg=152        ctermbg=195
hi ColorColumn  gui=NONE      guifg=NONE           guibg=LightGrey     cterm=NONE      ctermfg=NONE       ctermbg=237
hi Constant     gui=NONE      guifg=MistyRose3     guibg=bg            cterm=NONE      ctermfg=181        ctermbg=NONE
hi String       gui=NONE      guifg=LightBlue3     guibg=bg            cterm=NONE      ctermfg=110        ctermbg=NONE
hi Special      gui=NONE      guifg=GoldenRod      guibg=bg            cterm=NONE      ctermfg=178        ctermbg=NONE
hi Statement    gui=NONE      guifg=Khaki          guibg=bg            cterm=NONE      ctermfg=222        ctermbg=NONE
hi Operator     gui=NONE      guifg=LightSlateBlue guibg=bg            cterm=NONE      ctermfg=98         ctermbg=NONE
hi Ignore       gui=NONE      guifg=bg             guibg=bg            cterm=NONE      ctermfg=NONE       ctermbg=NONE
hi ToDo         gui=NONE      guifg=DodgerBlue     guibg=bg            cterm=NONE      ctermfg=33         ctermbg=NONE
hi Error        gui=NONE      guifg=Red            guibg=bg            cterm=NONE      ctermfg=196        ctermbg=NONE
hi Comment      gui=NONE      guifg=LightGrey      guibg=bg            cterm=NONE      ctermfg=LightGrey  ctermbg=NONE
hi Identifier   gui=bold      guifg=LightBlue4     guibg=bg            cterm=bold      ctermfg=66         ctermbg=NONE
hi PreProc      gui=NONE      guifg=LightPink2     guibg=bg            cterm=NONE      ctermfg=217        ctermbg=NONE
hi Type         gui=NONE      guifg=NavajoWhite    guibg=bg            cterm=NONE      ctermfg=223        ctermbg=NONE
hi Underlined   gui=underline guifg=fg             guibg=bg            cterm=underline ctermfg=fg         ctermbg=NONE

" End of Configuration

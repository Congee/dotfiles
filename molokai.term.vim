" Vim color file
"
" Author: Tomas Restrepo <tomas@winterdom.com>
"
" Note: Based on the monokai theme for textmate
" by Wimer Hazenberg and its darker variant 
" by Hamish Stuart Macpherson
"

hi clear

set background=dark
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif
let g:colors_name="molokai"

if exists("g:molokai_original")
    let s:molokai_original = g:molokai_original
else
    let s:molokai_original = 0
endif


highlight Boolean guifg=#ae81ff ctermfg=141
highlight Character guifg=#e6db74 ctermfg=185
highlight Number guifg=#ae81ff ctermfg=141
highlight String guifg=#e6db74 ctermfg=185
highlight Conditional guifg=#f92672 gui=bold ctermfg=197 cterm=bold
highlight Constant guifg=#ae81ff gui=bold ctermfg=141 cterm=bold
highlight Cursor guifg=#000000 guibg=#f8f8f0 ctermfg=16 ctermbg=231
highlight Debug guifg=#bca3a3 gui=bold ctermfg=181 cterm=bold
highlight Define guifg=#66d9ef ctermfg=45
highlight Delimiter guifg=#8f8f8f ctermfg=246
highlight DiffAdd guibg=#13354a ctermbg=236
highlight DiffChange guifg=#89807d guibg=#4c4745 ctermfg=244 ctermbg=238
highlight DiffDelete guifg=#960050 guibg=#1e0010 ctermfg=125 ctermbg=232
highlight DiffText guibg=#4c4745 gui=italic,bold ctermbg=238 cterm=bold

highlight Directory guifg=#a6e22e gui=bold ctermfg=112 cterm=bold
highlight Error guifg=#960050 guibg=#1e0010 ctermfg=125 ctermbg=232
highlight ErrorMsg guifg=#f92672 guibg=#232526 gui=bold ctermfg=197 ctermbg=235 cterm=bold
highlight Exception guifg=#a6e22e gui=bold ctermfg=112 cterm=bold
highlight Float guifg=#ae81ff ctermfg=141
highlight FoldColumn guifg=#465457 guibg=#000000 ctermfg=239 ctermbg=16
highlight Folded guifg=#465457 guibg=#000000 ctermfg=239 ctermbg=16
highlight Function guifg=#a6e22e ctermfg=112
highlight Identifier guifg=#fd971f ctermfg=208
highlight Ignore guifg=#808080 guibg=bg ctermfg=244
highlight IncSearch guifg=#c4be89 guibg=#000000 ctermfg=144 ctermbg=16

highlight Keyword guifg=#f92672 gui=bold ctermfg=197 cterm=bold
highlight Label guifg=#e6db74 gui=NONE ctermfg=185 cterm=NONE
highlight Macro guifg=#c4be89 gui=italic ctermfg=144
highlight SpecialKey guifg=#66d9ef gui=italic ctermfg=45

highlight MatchParen guifg=#000000 guibg=#fd971f gui=bold ctermfg=16 ctermbg=208 cterm=bold
highlight ModeMsg guifg=#e6db74 ctermfg=185
highlight MoreMsg guifg=#e6db74 ctermfg=185
highlight Operator guifg=#f92672 ctermfg=197

" complete menu
highlight Pmenu guifg=#66d9ef guibg=#000000 ctermfg=45 ctermbg=16
highlight PmenuSel guibg=#808080 ctermbg=244
highlight PmenuSbar guibg=#080808 ctermbg=232
highlight PmenuThumb guifg=#66d9ef ctermfg=45

highlight PreCondit guifg=#a6e22e gui=bold ctermfg=112 cterm=bold
highlight PreProc guifg=#a6e22e ctermfg=112
highlight Question guifg=#66d9ef ctermfg=45
highlight Repeat guifg=#f92672 gui=bold ctermfg=197 cterm=bold
highlight Search guifg=#ffffff guibg=#455354 ctermfg=231 ctermbg=239
" marks column
highlight SignColumn guifg=#a6e22e guibg=#232526 ctermfg=112 ctermbg=235
highlight SpecialChar guifg=#f92672 gui=bold ctermfg=197 cterm=bold
highlight SpecialComment guifg=#465457 gui=bold ctermfg=239 cterm=bold
highlight Special guifg=#66d9ef guibg=bg gui=italic ctermfg=45
highlight SpecialKey guifg=#888a85 gui=italic ctermfg=245
if has("spell")
highlight SpellBad guisp=#ff0000 gui=undercurl cterm=undercurl
highlight SpellCap guisp=#7070f0 gui=undercurl cterm=undercurl
highlight SpellLocal guisp=#70f0f0 gui=undercurl cterm=undercurl
highlight SpellRare guisp=#ffffff gui=undercurl cterm=undercurl
endif
highlight Statement guifg=#f92672 gui=bold ctermfg=197 cterm=bold
highlight StatusLine guifg=#455354 guibg=fg ctermfg=239
highlight StatusLineNC guifg=#808080 guibg=#080808 ctermfg=244 ctermbg=232
highlight StorageClass guifg=#fd971f gui=italic ctermfg=208
highlight Structure guifg=#66d9ef ctermfg=45
highlight Tag guifg=#f92672 gui=italic ctermfg=197
highlight Title guifg=#ef5939 ctermfg=196
highlight Todo guifg=#ffffff guibg=bg gui=bold ctermfg=231 cterm=bold

highlight Typedef guifg=#66d9ef ctermfg=45
highlight Type guifg=#66d9ef gui=NONE ctermfg=45 cterm=NONE
highlight Underlined guifg=#808080 gui=underline ctermfg=244 cterm=underline

highlight VertSplit guifg=#808080 guibg=#080808 gui=bold ctermfg=244 ctermbg=232 cterm=bold
highlight VisualNOS guibg=#403d3d ctermbg=237
highlight Visual guibg=#403d3d ctermbg=237
highlight WarningMsg guifg=#ffffff guibg=#333333 gui=bold ctermfg=231 ctermbg=236 cterm=bold
highlight WildMenu guifg=#66d9ef guibg=#000000 ctermfg=45 ctermbg=16

if s:molokai_original == 1
highlight Normal guifg=#f8f8f2 guibg=#272822 ctermfg=231 ctermbg=235
highlight Comment guifg=#75715e ctermfg=242
highlight CursorLine guibg=#3e3d32 ctermbg=237 cterm=NONE
highlight CursorColumn guibg=#3e3d32 ctermbg=237
highlight LineNr guifg=#bcbcbc guibg=#3b3a32 ctermfg=250 ctermbg=237
highlight NonText guifg=#bcbcbc guibg=#3b3a32 ctermfg=250 ctermbg=237
else
highlight Normal guifg=#f8f8f2 guibg=#1b1d1e ctermfg=231 ctermbg=234
highlight Comment guifg=#465457 ctermfg=239
highlight CursorLine guibg=#293739 ctermbg=236 cterm=NONE
highlight CursorColumn guibg=#293739 ctermbg=236
highlight LineNr guifg=#bcbcbc guibg=#232526 ctermfg=250 ctermbg=235
highlight NonText guifg=#bcbcbc guibg=#232526 ctermfg=250 ctermbg=235
end

"
" Support for 256-color terminal
"
if &t_Co > 255
highlight Boolean
highlight Character
highlight Number
highlight String
highlight Conditional cterm=bold
highlight Constant cterm=bold
highlight Cursor
highlight Debug cterm=bold
highlight Define
highlight Delimiter

highlight DiffAdd
highlight DiffChange
highlight DiffDelete
highlight DiffText cterm=bold

highlight Directory cterm=bold
highlight Error
highlight ErrorMsg cterm=bold
highlight Exception cterm=bold
highlight Float
highlight FoldColumn
highlight Folded
highlight Function
highlight Identifier
highlight Ignore
highlight IncSearch

highlight Keyword cterm=bold
highlight Label cterm=NONE
highlight Macro
highlight SpecialKey

highlight MatchParen cterm=bold
highlight ModeMsg
highlight MoreMsg
highlight Operator

   " complete menu
highlight Pmenu
highlight PmenuSel
highlight PmenuSbar
highlight PmenuThumb

highlight PreCondit cterm=bold
highlight PreProc
highlight Question
highlight Repeat cterm=bold
highlight Search

   " marks column
highlight SignColumn
highlight SpecialChar cterm=bold
highlight SpecialComment cterm=bold
highlight Special
highlight SpecialKey

highlight Statement cterm=bold
highlight StatusLine
highlight StatusLineNC
highlight StorageClass
highlight Structure
highlight Tag
highlight Title
highlight Todo cterm=bold

highlight Typedef
highlight Type cterm=NONE
highlight Underlined cterm=underline

highlight VertSplit cterm=bold
highlight VisualNOS
highlight Visual
highlight WarningMsg cterm=bold
highlight WildMenu

highlight Normal
highlight Comment
highlight CursorLine cterm=NONE
highlight CursorColumn
highlight LineNr
highlight NonText
end

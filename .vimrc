set nocompatible
" TODO: learn this:
" gi, gf, gD, CTRL-W f, [d, [-CTRL-D, [i, [_CTRL-I, g??
" z., z<CR>, zM, zi, zj, zk, za
" g8. :nf, v_CTRL-X_s, yiw, gv, gn
" MIGRATE TO Python2
" {{{ Plugins registration
call plug#begin()
let g:plug_url_format = 'git://github.com/%s.git'

Plug 'Shougo/vimshell.vim'
Plug 'bling/vim-bufferline'
Plug 'airblade/vim-gitgutter'
Plug 'kshenoy/vim-signature'
Plug 'aperezdc/vim-template'
Plug 'leafgarland/typescript-vim', {'for': 'typescript'}
Plug 'Quramy/tsuquyomi', {'for': 'typescript', 'do': 'VimProcInstall'}
Plug 'gerw/vim-latex-suite', {'for': 'tex'}
Plug 'dhruvasagar/vim-table-mode', {'for': 'markdown'}
Plug 'toyamarinyon/vim-swift', {'for': 'swift'}
Plug 'vim-scripts/a.vim', {'for': ['c', 'cpp']}
Plug 'lyuts/vim-rtags', {'for': ['c', 'cpp']}
Plug 'Shougo/vimproc.vim'
Plug 'tpope/vim-dispatch'
Plug 'rking/ag.vim'
Plug 'godlygeek/tabular'
Plug 'bling/vim-airline'
Plug 'IndentAnything'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'xuhdev/SingleCompile'
Plug 'kien/ctrlp.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/syntastic'
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'Rykka/colorv.vim', {'for': ['html', 'css', 'javascript']}
Plug 'rhysd/vim-clang-format', {'for': ['c', 'cpp']}
Plug 'tell-k/vim-autopep8', {'for': 'python'}
Plug 'vim-scripts/asmx86', {'for': ['nasm', 'asm']}
Plug 'Shougo/neocomplete.vim'
Plug 'hdima/python-syntax', {'for': 'python'}
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'Glench/Vim-Jinja2-Syntax'", {'for': 'html'}
Plug 'davidhalter/jedi-vim', {'for': 'python'}
Plug 'python-rope/ropevim', {'for': 'python'}
Plug 'mattn/emmet-vim', {'for': 'html'}
Plug 'Valloric/YouCompleteMe', {'for': ['c', 'cpp', 'objc', 'java']}
Plug 'elzr/vim-json', {'for': 'json'}
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'octol/vim-cpp-enhanced-highlight', {'for': ['c', 'cpp']}
Plug 'wting/rust.vim', {'for': 'rust'}
Plug 'racer-rust/vim-racer', {'for': 'rust'}
Plug 'applescript.vim', {'for': 'applescript'}
Plug 'benmills/vimux'

"Plug 'congee/python-vim-instant-markdown'
"Plug 'xuhdev/vim-latex-live-preview'
"Plug 'Glench/Vim-Jinja2-Syntax'
"Plug 'vim-scripts/TagHighlight'
"Plug 'jceb/vim-orgmode'
"Plug 'jalcine/cmake.vim', {'for': 'cmake'}
"Plug 'bbchung/clighter'
"Plug 'chrisbra/csv.vim'
"Plug 'jeaye/color_coded'

""" Colorscheme:
"Plug 'zenorocha/dracula-theme'
Plug 'molokai'
"Plug 'tomasr/molokai'
"Plug 'jdkanani/vim-material-theme'
"Plug 'reedes/vim-colors-pencil'
"Plug 'john2x/flatui.vim'
"Plug 'altercation/vim-colors-solarized'

call plug#end()
se rtp+=~/.vim/pyclewn/runtime
" }}}
color molokai
let g:molokai_original = 1
let g:solarized_termcolors = 256
if strftime("%H") >= 5 && strftime("%H") <= 18
  set background=light
else
  set background=dark
endif

set ruler  " display cursor location
set t_Co=256
set cursorline
"set showmatch
"se spell
se spelllang=en_us
"set dictionary=/usr/share/dict/words

setlocal cc=80
set helpheight=23
set incsearch
set hlsearch

let g:livepreview_previewer = 'open'

" {{{ Key mappings
let mapleader=","
set ttimeoutlen=100 " noremap O ko, See h: esckeys
nnoremap <Leader>pp :setlocal paste!<CR>
nnoremap <Leader>nl :nohl<CR>
nnoremap vv ^vg_
nnoremap <CR> o<Esc>
nnoremap <Space> a<Space><Esc>
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l

cnoremap <C-A> <Home>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <C-D> <Del>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>

noremap Q <Nop>  " prevent to enter Ex mode
""" Pressing q to quit when using vim as a Manpager.
autocmd FileType man noremap	q :q<cr>
""" NERDTree
nnoremap <Leader>nt :NERDTreeToggle<cr>
" NOTE: `stty -ixon' is required on some platforms
noremap  <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

" }}}

" {{{ Highlight
"syntax enable
syntax on
syntax sync minlines=256
let python_highlight_all = 1
highlight PmenuSel ctermbg = white
highlight Pmenu ctermbg = 129 ctermfg = black
highlight ColorColumn term=reverse ctermbg=234 guibg=#181818
highlight MatchParen cterm=bold ctermbg=none ctermfg=magenta

hi clear SpellBad
hi SpellBad cterm=bold ctermfg=magenta
"}}}

" {{{ Indent:
set wrap
set smarttab
set tabstop=4
set shiftwidth=4
set noexpandtab
set backspace=indent,eol,start
set cinoptions=i0
au BufEnter,VimEnter,VimResized,WinEnter *
			\ if winheight(0) >= 24 && winwidth(0) >= 80 | setl nu | endif
" }}}

" vim-airline
let g:airline_theme='serene'
let g:airline_powerline_fonts = 1
let g:airline_left_alt_sep = ''
let g:bufferline_echo = 0
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#eclim#enabled = 1

" vim-table-mode
let g:table_mode_corner_corner   = '+'
let g:table_mode_header_fillchar = '='

" vim-clang-format
let g:clang_format#command = "/usr/local/opt/llvm/bin/clang-format"
let g:clang_format#style_options = {
			\ "IndentWidth": 2,
			\ "AllowShortFunctionsOnASingleLine" : "false",
			\ "AllowShortIfStatementsOnASingleLine" : "true",
			\ }
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
"map <Leader>f :py3f $HOME/.vim/clang-format.py<CR>
"imap <Leader>f <ESC>:py3f $HOME/.vim/clang-format.py<CR>i

"noremap <Esc> :nohl<CR><Esc>
filetype plugin indent on
cnoreabbrev <expr> h
			\ ((getcmdtype() is# ':' && getcmdline() is# 'h')?('h'):('tab h'))

augroup buffer_new
	au BufRead,BufNewFile *.ejs   set filetype=html
	au BufRead,BufNewFile *.plist set filetype=xml
	au BufRead,BufNewFile *.styl  set filetype=css
	au BufRead,BufNewFile *.md    set filetype=markdown
	au BufRead,BufNewFile *.nasm  set filetype=nasm
	au BufRead,BufNewFile *.sb    set filetype=scheme
augroup END
au FileType typescript nnoremap <Leader>h	:echo tsuquyomi#hint()<cr>
au FileType zsh,lisp,cpp,coffee,jade,ruby,html set shiftwidth=2 tabstop=2

" {{{ gocode
"let g:go_disable_autoinstall = 1
"let g:go_auto_type_info = 1
"let g:go_highlight_functions = 1
"let g:go_highlight_methods = 1
"let g:go_highlight_structs = 1
" }}}

""" vim-markdown
autocmd FileType markdown setl shell=bash\ -i

" Ignore VCS filees and compiled files
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*.pyc,*.o

""" emmet(Zencoding) settings
"let g:user_emmet_mode="inc"

""" UltiSnips
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

let g:UltiSnipsSnippetDirectories=["UltiSnips"] " snippets path
let g:UltiSnipsUsePythonVersion = 2
" let g:UltiSnipsDontReverseSearchPath="1" " Traverse in reverse order

""" js-beautify
augroup html
	autocmd!
	au FileType javascript noremap <Leader>fm :call JsBeautify()<cr>
	au FileType html       noremap <Leader>fm	:call HtmlBeautify()<cr>
	au FileType CSS        noremap <Leader>fm :call CSSBeautify()<cr>
augroup END


" autopep8
let g:autopep8_disable_show_diff = 1

" {{{ Syntastic settings
let g:syntastic_auto_jump=3	 "jump to the first detected error rather than warn
let g:syntastic_auto_loc_list = 2

let g:syntastic_python_python_exe = 'python3'	"python3 support
let g:syntastic_python_checkers = ['pyflakes', 'pep8']
" to silence warnings
let g:syntastic_python_pylint_quiet_messages = {"level": "warning"}

let g:syntastic_nasm_nasm_args = "-X gnu"
" E301, E302, E303, E304 => Extra blank lines may be used (sparingly)
" W391 => JCR: Trailing blank lines are superfluous.
" E501 => Limit all lines to a maximum of 79 characters.
" let g:syntastic_python_pylint_args='--ignore=E501,W391,E301,E302,E303,E304'
let g:syntastic_python_pep8_args =
			\ '--ignore=E501,W391,E122,E128,E266,E301,E302,E303,E304'
let g:syntastic_zsh_shellcheck_args = '--exclude=SC2016,SC2046,SC2086'

let g:syntastic_typescript_checkers = ['tslint']

"debug
"let g:syntastic_debug = 1
"let g:syntastic_debug_file = '~/syntastic.log'
" }}}

" {{{ Completion
set wildmenu
"" don't want the docstring window to popup during completion
augroup filetype_python
	autocmd!
	autocmd FileType python setlocal completeopt-=preview
	autocmd FileType python setlocal cc=80
	autocmd FileType python highlight ColorColumn
				\ term=reverse ctermbg=234
	"autocmd FileType python setlocal omnifunc=python3complete#Complete
augroup END

augroup syntax_omnifunc
	au FileType swift,applescript,cmake setl omnifunc=syntaxcomplete#Complete
augroup END

setlocal completeopt-=preview

""" rust
let g:racer_cmd = $HOME . "/src/rust/racer/target/release/racer"
let $RUST_SRC_PATH=$HOME . "/src/rust/rust/src"
"must be set before syntax on
"syntax on will override color settings while syntax enable won't

au FileType rust let b:dispatch = 'cargo build'

" don't auto select first completion candiate
imap <C-X><C-O> <C-X><C-O><C-P>
imap <C-X><C-I> <C-X><C-I><C-P>

let g:neocomplete#enable_at_startup = 1
let g:acp_enableAtStartup = 0 " Disable AutoComplPop.
let g:neocomplete#enable_smart_case = 1 " Use smartcase.
"let g:neocomplete#sources#syntax#min_keyword_length = 3

" Plugin key-mappings.
inoremap <C-h> <BS>
"if !hasmapto("<C-h>", "i")
"	inoremap <C-h>			neocomplete#smart_close_popup()
"endif

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
	return neocomplete#close_popup() . "\<CR>"
	" For no inserting <CR> key.
	return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction

" AutoComplPop like behavior. 0 default
let g:neocomplete#enable_auto_select = 0

""" Using the jedi-python autocompletion library for VIM.
autocmd FileType python,c,cpp,objc,java NeoCompleteLock

let g:ycm_auto_trigger = 0
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_extra_conf_vim_data = ['&filetype']	"gives access to ycm_extra_conf
let g:ycm_key_invoke_completion = '<C-X><C-O>'
let g:EclimCompletionMethod = 'omnifunc'
"let g:UltiSnipsExpandTrigger = "<tab>"
"let g:UltiSnipsJumpForwardTrigger = "<tab>"
"let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
nnoremap <leader>jd :YcmCompleter GoTo<CR>
nnoremap <leader>gt :YcmCompleter GetType<CR>

let g:jedi#auto_vim_configuration = 0
" only use python3
let g:jedi#force_py_version = 3
" don't popup on typing dot
let g:jedi#popup_on_dot = 0
" don't select first autoly
let g:jedi#popup_select_first = 1
hi jediFunction
			\ term=NONE cterm=NONE ctermfg=6 ctermbg=0
			\ guifg=Black gui=NONE guibg=Grey

let g:indentLine_enabled = 0
let g:indentLine_char = '┊'
autocmd FileType python let g:indentLine_enabled = 1
let g:indentLine_color_term = 239

" }}}

""" Tagbar
nmap <Leader>tb :TagbarToggle<cr>
let g:tagbar_ctags_bin='/usr/local/bin/ctags'
let g:rtagsUseDefaultMappings = 0

""" FileFormats settings for CrossPlatform
if has("unix")  " Mac OS X is now unix
	set fencs=utf8,gb18030,gbk,gb2312,ucs-bom
	set termencoding=utf-8
	""" Auto source .vimrc after saving.
	autocmd! bufwritepost .vimrc source ~/.vimrc
	""" MacVimsettings
	if has("gui_macvim")
		set go=aAce
		set transparency=15
		set guifont=Monaco\ for\ Powerline:h13
		set showtabline=1
		set columns=83
		set lines=24
		colorscheme molokai
		""" Macvim MultiTab support
		noremap <D-[> :tabprevious<cr>
		noremap <D-]> :tabnext<cr>
		noremap <D-1> 1gt | noremap <D-2> 2gt | noremap <D-3> 3gt
	   	noremap <D-4> 4gt | noremap <D-5> 5gt | noremap <D-6> 6gt
	   	noremap <D-7> 7gt | noremap <D-8> 8gt | noremap <D-9> 9gt
		noremap <D-0> :tablast<cr>
	endif
elseif has('win')
	autocmd! bufwritepost _vimrc source ~/_vimrc
endif

if has('mouse') | se mouse=a | endif
command! DeleteTrailingWhiteSpaces %s/\s\+$//ge

" vim: se fdm=marker:

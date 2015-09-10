set nocompatible
call plug#begin()
let g:plug_url_format = 'git://github.com/%s.git'

Plug 'gerw/vim-latex-suite', {'for': 'tex'}
"Plug 'xuhdev/vim-latex-live-preview'
"Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'dhruvasagar/vim-table-mode', {'for': 'markdown'}
Plug 'toyamarinyon/vim-swift', {'for': 'swift'}
"Plug 'vim-scripts/TagHighlight'
"Plug 'zaiste/tmux.vim'
"Plug 'benmills/vimux'
"Plug 'jceb/vim-orgmode'
"Plug 'jalcine/cmake.vim'
"Plug 'bbchung/clighter'
"Plug 'chrisbra/csv.vim'
"Plug 'Congee/ycm_py3'
"Plug 'jeaye/color_coded'

Plug 'rking/ag.vim'
Plug 'a.vim', {'for': ['c', 'cpp']}
Plug 'godlygeek/tabular'
Plug 'bling/vim-airline'
Plug 'Rykka/colorv.vim', {'for': ['html', 'css', 'javascript']}
Plug 'rhysd/vim-clang-format', {'for': ['c', 'cpp']}
Plug 'vim-scripts/asmx86'
Plug 'Shougo/neocomplete.vim'
Plug 'hdima/python-syntax', {'for': 'python'}
Plug 'IndentAnything'
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'SirVer/ultisnips'
Plug 'Yggdroot/indentLine'
Plug 'davidhalter/jedi-vim', {'for': 'python'}
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim', {'for': 'html'}
Plug 'scrooloose/syntastic'
Plug 'tell-k/vim-autopep8', {'for': 'python'}
Plug 'xuhdev/SingleCompile'
Plug 'majutsushi/tagbar'
Plug 'myint/clang-complete', {'for': ['c', 'cpp']}
Plug 'elzr/vim-json'
Plug 'junegunn/vim-peekaboo'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'octol/vim-cpp-enhanced-highlight', {'for': ['c', 'cpp']}
Plug 'wting/rust.vim', {'for': 'rust'}
Plug 'phildawes/racer', {'for': 'rust'}
Plug 'congee/python-vim-instant-markdown'
Plug 'applescript.vim'

""" Colorscheme:
Plug 'molokai'
"Plug 'tomasr/molokai'
"Plug 'jdkanani/vim-material-theme'
"Plug 'reedes/vim-colors-pencil'
"Plug 'john2x/flatui.vim'
"Plug 'altercation/vim-colors-solarized'

call plug#end() 

colorscheme molokai
let g:molokai_original = 1
let g:solarized_termcolors = 256
if strftime("%H") >= 5 && strftime("%H") <= 18
  set background=light
else
  set background=dark
endif

:cnoremap <C-A> <Home>
:cnoremap <C-F> <Right>
:cnoremap <C-B> <Left>
:cnoremap <C-D> <Del>
:cnoremap <Esc>b <S-Left>
:cnoremap <Esc>f <S-Right>

:nnoremap <M-h> <C-w>h
:nnoremap <M-j> <C-w>j
:nnoremap <M-k> <C-w>k
:nnoremap <M-l> <C-w>l

set ruler  " display cursor location
set t_Co=256
set cursorline
"set showmatch
"se spell
se spelllang=en_us
"set dictionary=/usr/share/dict/words

set helpheight=23
set incsearch
set hlsearch
let mapleader=","

let g:livepreview_previewer = 'open'

""" rust
let $RUST_SRC_PATH=$HOME . "/src/rust/rust/src"
"let g:racer_cmd = $HOME . ".vim/bundle/racer/target/release/racer"
"must be set before syntax on
"syntax on will override color settings while syntax enable won't


""" Syntax:
"syntax enable
syntax on
syntax sync minlines=256
let python_highlight_all = 1
highlight PmenuSel ctermbg = white
highlight Pmenu ctermbg = 129 ctermfg = black
highlight ColorColumn term=reverse ctermbg=234
highlight MatchParen cterm=bold ctermbg=none ctermfg=magenta

hi clear SpellBad
hi SpellBad cterm=bold ctermfg=magenta

" vim-airline
let g:airline_theme='serene'
let g:airline_powerline_fonts = 1
let g:airline_left_alt_sep = ''

""" Indent:
set wrap
set smarttab
set tabstop=4
set shiftwidth=4
set noexpandtab
set backspace=indent,eol,start
au BufEnter,VimEnter,VimResized,WinEnter *
			\ if winheight(0) >= 24 && winwidth(0) >= 80 | setl nu | endif

" vim-table-mode
let g:table_mode_corner_corner   = '+'
let g:table_mode_header_fillchar = '='

" vim-clang-format
let g:clang_format#command = "/usr/local/opt/llvm/bin/clang-format"
let g:clang_format#code_style = "google"
"let g:clang_format#auto_format_on_insert_leave = 1
let g:clang_format#style_options = {
			\ "IndentWidth" : 2,
			\ "AlignTrailingComments" : "true",
			\ "AllowShortFunctionsOnASingleLine" : "false",
			\ "AllowShortIfStatementsOnASingleLine" : "true",
			\ "AllowShortLoopsOnASingleLine" : "true",
			\ "AllowAllParametersOfDeclarationOnNextLine" : "true",
			\}
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
"map <Leader>f :py3f $HOME/.vim/clang-format.py<CR>
"imap <Leader>f <ESC>:py3f $HOME/.vim/clang-format.py<CR>i

set ttimeoutlen=100 " noremap O ko, See h: esckeys
nnoremap <Leader>pp :setlocal paste!<CR>
nnoremap <Leader>nl :nohl<CR>
noremap vv ^vg_
noremap <CR> o<Esc>
noremap <Space> a<Space><Esc>
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
au FileType zsh,lisp,coffee,jade,ruby,html set shiftwidth=2 tabstop=2


Plug 'fatih/vim-go', {'for': 'go'}
let g:go_disable_autoinstall = 1
let g:go_auto_type_info = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

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

if has("autocmd")
	" Ultisnips is unable to detect filetype due to vundle
	" .vim/ftdetect/UltiSnips.vim
	autocmd FileType * call UltiSnips#FileTypeChanged()
	" recognize .snippet files
	autocmd BufNewFile,BufRead *.snippets setf snippets
endif
let g:UltiSnipsSnippetDirectories=["UltiSnips"] " snippets path
let g:UltiSnipsUsePythonVersion = 3
" let g:UltiSnipsDontReverseSearchPath="1" " Traverse in reverse order

""" NERDTree
nmap <Leader>nt :NERDTreeToggle<cr>

"Plug 'gelguy/Cmd2.vim'

""" js-beautify
augroup html
	autocmd!
	au BufNewFile,BufRead javascript noremap <Leader>fm :call JsBeautify()<cr>
	au BufNewFile,BufRead html       noremap <Leader>fm	:call HtmlBeautify()<cr>
	au BufNewFile,BufRead CSS        noremap <Leader>fm :call CSSBeautify()<cr>
augroup END

""" Pressing q to quit when using vim as a Manpager.
autocmd BufNewFile,BufRead man noremap	q :q<cr>

""" ipython integrated
"Plug 'ivanov/vim-ipython'

" autopep8
let g:autopep8_disable_show_diff=1

""" Syntastic settings
let g:syntastic_auto_jump=3	 "jump to the first detected error rather than warn
let g:syntastic_auto_loc_list = 2

let g:syntastic_c_compiler='clang'
let g:syntastic_c_compiler_options=' -std=c11'
let g:syntastic_c_checkers=['gcc', 'clang_tidy', 'clang_check']
let g:syntastic_c_clang_tidy_exec = "/usr/local/opt/llvm/bin/clang-tidy"
let g:syntastic_c_clang_check_exec = "/usr/local/opt/llvm/bin/clang-check"

let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

" file containing compilation flags (such as defines or include directories)
let g:syntastic_gcc_config_file = '.clang_complete'

let g:syntastic_python_python_exe = 'python3'	"python3 support
let g:syntastic_python_checkers=['pep8']
" to silence warnings
let g:syntastic_python_pylint_quiet_messages = {"level": "warning"}

let g:syntastic_nasm_nasm_args = "-X gnu"
" E301, E302, E303, E304 => Extra blank lines may be used (sparingly)
" W391 => JCR: Trailing blank lines are superfluous.
" E501 => Limit all lines to a maximum of 79 characters.
" let g:syntastic_python_pylint_args='--ignore=E501,W391,E301,E302,E303,E304'
let g:syntastic_python_pep8_args=
			\ '--ignore=E501,W391,E122,E128,E266,E301,E302,E303,E304'
let g:syntastic_zsh_shellcheck_args='--exclude=SC2016,SC2046,SC2086'

"debug
"let g:syntastic_debug = 1
"let g:syntastic_debug_file = '~/syntastic.log'

""" Completion
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
setlocal cc=80

setlocal completeopt-=preview

" clang_complete
let g:clang_debug = 0
let g:clang_complete_auto = 0
let g:clang_user_options = "-std=c++11"
let g:clang_library_path =
			\ '/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
let g:clang_conceal_snippets = 1
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
autocmd FileType python,c,cpp NeoCompleteLock

"Plug 'Valloric/YouCompleteMe'
"let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
"
"let g:ycm_key_invoke_completion = '<C-B>'
"let g:UltiSnipsExpandTrigger = "<tab>"
"let g:UltiSnipsJumpForwardTrigger = "<tab>"
"let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

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

"Plug 'kien/rainbow_parentheses.vim'
"au VimEnter * :RainbowParenthesesToggle       " Toggle it on/off
"au Syntax * :RainbowParenthesesLoadRound    " (), the default when toggling
"au Syntax * :RainbowParenthesesLoadSquare   " []
"au Syntax * :RainbowParenthesesLoadBraces   " {}
"au Syntax * :RainbowParenthesesLoadChevrons " <>

""" Tagbar
nmap <Leader>tb :TagbarToggle<cr>
let g:tagbar_ctags_bin='/usr/local/bin/ctags'
let g:tagbar_type_ruby = {
			\ 'kinds' : [
			\ 'm:modules',
			\ 'c:classes',
			\ 'd:describes',
			\ 'C:contexts',
			\ 'f:methods',
			\ 'F:singleton methods'
			\ ]
			\ }

""" FileFormats settings for CrossPlatform
if has("unix") " Mac OS X is now unix
	set fencs=utf8,gb18030,gbk,gb2312,ucs-bom
	set termencoding=utf-8
	""" Auto source .vimrc after saving.
	autocmd! bufwritepost .vimrc source ~/.vimrc
	""" MacVimsettings
	if has("gui_macvim")
		set go=aAce
		set transparency=15
		set guifont=Monaco:h12.5
		set showtabline=1
		set columns=100
		set lines=30
		colorscheme murphy
		""" Macvim MultiTab support
		noremap <D-[> :tabprevious<cr>
		noremap <D-]> :tabnext<cr>
		map <D-1> 1gt
		map <D-2> 2gt
		map <D-3> 3gt
		map <D-4> 4gt
		map <D-5> 5gt
		map <D-6> 6gt
		map <D-7> 7gt
		map <D-8> 8gt
		map <D-9> 9gt
		map <D-0> :tablast<cr>
	endif
elseif has('win')
	autocmd! bufwritepost _vimrc source ~/_vimrc
endif

if has('mouse') | se mouse=a | endif

function! DeleteTrailingWS()
	%s/\s\+$//ge
endfunction

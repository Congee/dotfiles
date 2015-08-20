""" vundle settings
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
let g:vundle_default_git_proto = 'git'
" let Vundle manage Vundle
" required!
Plugin 'gmarik/vundle'

"Plugin 'mattn/calendar-vim'
Plugin 'applescript.vim'
Plugin 'toyamarinyon/vim-swift'
Plugin 'Rykka/colorv.vim'
"Required for fetching schemes online.
"Plugin 'mattn/webapi-vim'

" Colorscheme
Plugin 'molokai'
"""
set t_Co=256
colorscheme molokai
set cursorline
set showmatch
"set dictionary=/usr/share/dict/words

set helpheight=23
set incsearch
set hlsearch
let mapleader=","

"""
Plugin 'mustache/vim-mustache-handlebars'
"must be set before syntax on
"syntax on will override color settings while syntax eneble won't
"""
" Syntax
Plugin 'hdima/python-syntax' 
syntax enable
syntax sync minlines=256
let python_highlight_all = 1
hi MatchParen ctermbg = green
hi Pmenu ctermbg = 129 ctermfg = black
hi PmenuSel ctermbg = white

Plugin 'bling/vim-airline'
let g:airline_theme='serene'

""" Indent
Plugin 'IndentAnything'
set wrap
set smarttab
set tabstop=4  
set shiftwidth=4
set noexpandtab
set backspace=indent,eol,start
au BufEnter,VimResized * if &lines >= 30 && &columns >=80 | se nu | endif

set ttimeoutlen=100 " noremap O ko, See h: esckeys
nnoremap <Leader>pp :setlocal paste!<CR>
nnoremap <Leader>nl :nohl<CR>
noremap vv ^vg_
noremap <CR> o<Esc>
noremap <Space> a<Space><Esc>
filetype plugin indent on
cnoreabbrev <expr> h ((getcmdtype() is# ':' && getcmdline() is# 'h')?('h'):('tab h'))

au FileType zsh,lisp,coffee,jade,ruby,html set shiftwidth=2 tabstop=2
augroup buffer_new
	au BufRead,BufNewFile *.ejs set filetype=html
	au BufRead,BufNewFile *.plist set filetype=xml
	au BufRead,BufNewFile *.styl set filetype=css
	au BufRead,BufNewFile *.md   set filetype=markdown
	au BufRead,BufNewFile *.sb   set filetype=scheme
augroup END



"""
Plugin 'rking/ag.vim'
Plugin 'a.vim'
Plugin 'godlygeek/tabular'


Plugin 'fatih/vim-go'
let g:go_disable_autoinstall = 1
let g:go_auto_type_info = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

""" vim-markdown
Plugin 'plasticboy/vim-markdown'
autocmd FileType markdown setl shell=bash\ -i
"""

""" vim-instant-markdown
Plugin  'suan/vim-instant-markdown'
let g:instant_markdown_slow=1
let g:instant_markdown_autostart=0
"""

""" required for tmux.conf
Plugin 'zaiste/tmux.vim'
Plugin 'benmills/vimux'

""" Taghighlight: highlight code according to tags
Plugin 'https://Congee@bitbucket.org/Congee/taghighlight.git'

""" ctrlp
Plugin 'kien/ctrlp.vim'

" Ignore VCS filees and compiled files
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*.pyc,*.o

Plugin 'tpope/vim-surround'

""" emmet(Zencoding) settings
Plugin 'mattn/emmet-vim'
"let g:user_emmet_mode="inc"

""" UltiSnips
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

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
Plugin 'scrooloose/nerdtree'
nmap <Leader>nt :NERDTreeToggle<cr>

""" js-beautify
Plugin 'einars/js-beautify'
Plugin 'maksimr/vim-jsbeautify'
augroup html
	autocmd!
	au BufNewFile,BufRead javascript noremap <Leader>fm :call JsBeautify()<cr>
	au BufNewFile,BufRead html	noremap	<Leader>fm	:call HtmlBeautify()<cr>
	au BufNewFile,BufRead CSS noremap <Leader>fm :call CSSBeautify()<cr>
augroup END

""" Pressing q to quit when using vim as a Manpager.
autocmd BufNewFile,BufRead man noremap	q :q<cr>

""" ipython integrated
"Plugin 'ivanov/vim-ipython'

""" Syntastic settings
Plugin 'scrooloose/syntastic'
let g:syntastic_auto_jump=2	"jump to the first detected error rather than warn
let g:syntastic_python_python_exe = 'python3'	"python3 support
let g:syntastic_python_checkers=['pep8']
let g:syntastic_python_pylint_quiet_messages = {"level": "warning"} " silence warnings
" E301, E302, E303, E304 => Extra blank lines may be used (sparingly)
" W391 => JCR: Trailing blank lines are superfluous.
" E501 => Limit all lines to a maximum of 79 characters.
" let g:syntastic_python_pylint_args='--ignore=E501,W391,E301,E302,E303,E304'
let g:syntastic_python_pep8_args='--ignore=E501,W391,E301,E302,E303,E304'

"debug
"let g:syntastic_debug = 1
"let g:syntastic_debug_file = '~/syntastic.log'

""" Completion
set wildmenu
"" don't want the docstring window to popup during completion
augroup filetype_python
	autocmd!
	autocmd FileType python setlocal completeopt-=preview
	autocmd FileType python setlocal omnifunc=python3complete#Complete
augroup END

Plugin 'Shougo/neocomplete.vim'
let g:neocomplete#enable_at_startup = 1
let g:acp_enableAtStartup = 0 " Disable AutoComplPop.
let g:neocomplete#enable_smart_case = 1 " Use smartcase.
"let g:neocomplete#sources#syntax#min_keyword_length = 3

" Plugin key-mappings.
inoremap <expr><C-g>	neocomplete#undo_completion()
inoremap <expr><C-l>	neocomplete#complete_common_string()

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
	\ 'default' : '',
	\ }
"\ 'swift' : '$HOME/.vim/bundle/neocomplete-swift-dictionary/dict',

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
"autocmd FileType python NeoCompleteLock



"Plugin 'davidhalter/jedi-vim'
"" only use python3
"let g:jedi#force_py_version = 3
"" don't popup on typing dot
"let g:jedi#popup_on_dot = 0
"" don't select first autoly
"let g:jedi#popup_select_first = 1
"let g:jedi#auto_vim_configuration = 0
"hi jediFunction term=NONE cterm=NONE ctermfg=6 guifg=Black gui=NONE ctermbg=0 guibg=Grey

Plugin 'Yggdroot/indentLine'
let g:indentLine_enabled = 0
autocmd FileType python let g:indentLine_enabled = 1
let g:indentLine_color_term = 239

"Plugin "kien/rainbow_parentheses.vim"
"au VimEnter * :RainbowParenthesesToggle       " Toggle it on/off
"au Syntax * :RainbowParenthesesLoadRound    " (), the default when toggling
"au Syntax * :RainbowParenthesesLoadSquare   " []
"au Syntax * :RainbowParenthesesLoadBraces   " {}
"au Syntax * :RainbowParenthesesLoadChevrons " <>

""" Tagbar
Plugin 'majutsushi/tagbar'
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

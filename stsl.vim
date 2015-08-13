autocmd VimEnter * call Test()
func! Test()
	autocmd CmdwinLeave * call DynamicStatusline()
endfunction

function! DynamicStatusline()
	let g:test = 0
	if &laststatus == 2
		let g:bufferline_echo = 0
		let &statusline='%{bufferline#refresh_status()}'
						\ .bufferline#get_status_string()
						\ .'%=%74.(%l,%c%V%) %P' "use '<' or '%=' for right align
						\ .%{tagbar#currenttag('[%s] ','')} " current 
	else
		let g:bufferline_echo = 1
		let &statusline='%{bufferline#refresh_status()}'
						\ .bufferline#get_status_string()
						\ .'%=%74.(%l,%c%V%) %P' "use '<' or '%=' for right align
						\ .%{tagbar#currenttag('[%s] ','')} " current 
	endif
endfunction
echo 'g:bufferline_echo='g:bufferline_echo
echo 'laststatus='&laststatus

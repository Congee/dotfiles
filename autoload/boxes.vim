if !exists("g:boxes_filetype_design_map")
	let g:boxes_filetype_design_map = {
				\"c": "c-cmt2",
				\"cpp": "c-cmt2",
				\"vim": "vim-cmt"
				\}	
endif

function! boxes#format(is_reverse) range
	if a:is_reverse == "reverse"
		let l:args = "boxes -r -d " . g:boxes_filetype_design_map[&filetype]
	else
		let l:args = "boxes -d "	. g:boxes_filetype_design_map[&filetype]
	endif

	let lines = getline(a:firstline, a:lastline)
	let formatted = system(l:args, join(lines, "\n"))
	let lines = split(formatted, "\n")
	call setline(a:firstline, lines)
endfunction


command! -range Boxes <line1>,<line2> call boxes#format("no_reverse")
command! -range BoxesRemove <line1>,<line2> call boxes#format("reverse")

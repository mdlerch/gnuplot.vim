let maplocalleader = ","

map <buffer><localleader>gp <ESC>:w<CR>:!gnuplot % <CR>
map <buffer><localleader>gs <ESC>:ScreenShell gnuplot <CR>
map <buffer><localleader>pp <ESC>:call PreviewPlot() <CR>

function! PreviewPlot()
	let l:setT = search("^set terminal", "w")
	if l:setT != 0
		s/^/#/
		ScreenSend
		s/^#//
	else
		ScreenSend
	endif
endfunction


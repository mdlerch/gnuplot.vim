let maplocalleader = ","

map <buffer><localleader>gp <ESC>:w<CR>:!gnuplot % <CR>
map <buffer><localleader>gs <ESC>:ScreenShell gnuplot <CR>
map <buffer><localleader>pp <ESC>:call PreviewPlot() <CR>

function! PreviewPlot()
	let l:curL = line(".")
	let l:pos = line2byte(l:curL)
	let l:setT = search("^set terminal", "w")
	if l:setT != 0
		let l:curTerm = getline(".")
		s/^.*$/set terminal wxt/
		ScreenSend
		let cmd = "s/^.*$/" . l:curTerm . "/"
		exe cmd
		noh
	else
		goto 1
		s/^/set terminal wxt;/
		ScreenSend
		s/^set terminal wxt;//
	endif
	let cmd = "goto " . l:pos
	exe cmd
endfunction


let maplocalleader = ","

" map <buffer><localleader>gp <ESC>:w<CR>:!gnuplot % <CR>
function! GnuplotBuild()
	:w
	:!gnuplot %
endfunction
command! -nargs=0 GnuplotBuild call GnuplotBuild()

function! GnuplotStart()
	if !exists(":ScreenShell")
		echom "Please install the screen plugin"
	else
		:ScreenShell gnuplot
	endif
endfunction
command! -nargs=0 GnuplotStart call GnuplotStart()

function! GnuplotPreview()
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
command! -nargs=0 GnuplotPreview call GnuplotPreview()


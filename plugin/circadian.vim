" circadian.vim - Sets color theme based on time of day
" Maintainer: Adam Schill Collberg <adam.schill.collberg@protonmail.com>
" Version: 0.1.0
" License: This file is placed in the public domain

if exists("g:loaded_circadian")
	finish
endif
let g:loaded_circadian = 1

let s:night_start = 19
if exists("g:circadian_night_start")
	let s:night_start = g:circadian_night_start
endif

let s:day_start = 8
if exists("g:circadian_day_start")
	let s:day_start = g:circadian_day_start
endif

" Cache latest daytime check in this var
let s:day = v:true

fun! s:set_theme(timer_id)
	let l:hour = strftime('%H')
	let l:day = 0

	if l:hour > s:day_start && l:hour < s:night_start
		let l:day = v:true
	else
		let l:day = v:false
	endif

	if s:day == l:day
		return
	else
		let s:day = l:day
	endif

	if s:day == v:true
		if exists("g:circadian_day_theme")
			execute "colorscheme ".g:circadian_day_theme
		endif
        if exists("g:circadian_day_cmds")
            execute g:circadian_day_cmds
        endif
	else
		if exists("g:circadian_night_theme")
			execute "colorscheme ".g:circadian_night_theme
		endif
        if exists("g:circadian_night_cmds")
            execute g:circadian_night_cmds
        endif
	endif
endfun

" Run every two minutes
call timer_start(1000 * 60 * 2, function('s:set_theme'), {'repeat': -1})
" Run on startup
call s:set_theme(0)

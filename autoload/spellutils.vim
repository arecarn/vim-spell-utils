"TODO use spellbadword() to detect if you are currently on a bad word


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! spellutils#InsertCorrection(direction) abort "{{{2
    if &spell

        let colPos = getpos(".")[2]
        let oldLen = len(getline('.'))

        let motion = s:ReturnOperator(a:direction)

        call s:GoToBadWord(a:direction)
        sleep 50m
        call s:FixSpelling()
        sleep 50m
        normal gi

        let newLen = len(getline('.'))

        let lenDifference = oldLen - newLen
        if oldLen > newLen
            if oldLen != colPos
                execute "normal! ". lenDifference ."h"
            endif
        elseif newLen > oldLen
            let lenDifference = abs(lenDifference)
            execute "normal! ". lenDifference ."l"
        endif
    else
        call s:PrintSpellingWarningMsg()
    endif
endfunction "}}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! spellutils#NormalCorrection(direction) abort "{{{2
    if &spell
        call s:GoToBadWord(a:direction)
        sleep 300m
        redraw
        call s:FixSpelling()
    else
        call s:PrintSpellingWarningMsg()
    endif
endfunction "}}}2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:ReturnOperator(direction) abort "{{{2
    if a:direction ==# 'forward'
        return ']s'
    elseif a:direction ==# 'backward'
        return '[s'
    else
        throw "Must use 'forward' or 'backward' as argument"
    endif
endfunction "}}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:GoToBadWord(direction) abort abort "{{{2
    " call spellbadword()
    " if moved backward we where on a bad word
    " if we didn't move and returned a bad word we were already
    " if we didn't move and didn't return a bad word
    " if moved forward we moved to a new word

    " let winpos = winsaveview()
    " let col = col('.')
    " let line = line('.')

    " if spellbadword() != ['', '']
    " else
    "     if col
    " endif

    execute "normal! ".s:ReturnOperator(a:direction)
endfunction "}}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:FixSpelling() abort abort "{{{2
    normal! 1z=
endfunction "}}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:PrintSpellingWarningMsg() abort "{{{2
    echohl WarningMsg | echo "spelling not enabled" | echohl None
endfunction "}}}


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim:foldmethod=marker

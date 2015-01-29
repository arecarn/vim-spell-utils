function! s:InsertSpellCorrection(direction)
    if &spell

        let colPos = getpos(".")[2]
        let oldLen = len(getline('.'))

        if a:direction ==# 'forward'
            let motion = ']s'
        elseif a:direction ==# 'backward'
            let motion = '[s'
        else
            throw "Must use 'forward' or 'backward' as argument"
        endif

        execute "normal! ".motion
        sleep 50m
        normal! 1z=gi
        sleep 50m

        let newLen = len(getline('.'))

        let lenDifference =  oldLen - newLen
        if oldLen > newLen
            if oldLen != colPos
                execute "normal! ". lenDifference ."h"
            endif
        elseif newLen > oldLen
            let lenDifference = abs(lenDifference)
            execute "normal! ". lenDifference ."l"
        endif

        call feedkeys("a")
    else
        echohl WarningMsg | echo "spelling no enabled" | echohl None
    endif
endfunction

inoremap <silent> <Plug>(insert-spell-correction-backward) <Esc>:<C-u>call <SID>InsertSpellCorrection('backward')<Cr>
imap <C-s> <Plug>(insert-spell-correction-backward)

inoremap <silent> <Plug>(insert-spell-correction-forward) <Esc>:<C-u>call <SID>InsertSpellCorrection('forward')<Cr>
imap <C-l> <Plug>(insert-spell-correction-forward)


"problem
" press i <c-s>  on the first character of line 2 (end up on the second character)
"1. hex
"2.

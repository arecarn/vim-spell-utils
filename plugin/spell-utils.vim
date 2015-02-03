"TODO use spellbadword() to detect if you are currently on a bad word
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:InsertSpellCorrection(direction)
    if &spell

        let colPos = getpos(".")[2]
        let oldLen = len(getline('.'))

        let motion = s:ReturnSpellOperator(a:direction)

        call s:GoToBadWord(a:direction)
        call s:FixSpelling()
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
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:ReturnSpellOperator(direction)
    if a:direction ==# 'forward'
        return ']s'
    elseif a:direction ==# 'backward'
        return '[s'
    else
        throw "Must use 'forward' or 'backward' as argument"
    endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  call spellbadword()
"  if moved backward we where on a bad word
"  if we didn't move and returned a bad word we were already
"  if we didn't move and didn't return a bad word 
"  if moved forward we moved to a new word
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:GoToBadWord(direction) abort
    " let winpos = winsaveview()
    " let col = col('.')
    " let line = line('.')

    " if spellbadword() != ['', '']
    " else
    "     if col
    " endif

    execute "normal! ".s:ReturnSpellOperator(a:direction)

endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:FixSpelling() abort
    sleep 50m
    normal! 1z=
    sleep 50m
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:PrintSpellingWarningMsg()
    echohl WarningMsg | echo "spelling not enabled" | echohl None
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:NormalSpellCorrection(direction)
    if &spell
        call s:GoToBadWord(a:direction)
        call s:FixSpelling()
    else
        call s:PrintSpellingWarningMsg()
    endif
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <silent> <Plug>(insert-spell-correction-forward)  <C-o>:<C-u>call <SID>InsertSpellCorrection('forward')<Cr>
imap <C-k> <Plug>(insert-spell-correction-forward)

inoremap <silent> <Plug>(insert-spell-correction-backward) <C-o>:<C-u>call <SID>InsertSpellCorrection('backward')<Cr>
imap <C-s> <Plug>(insert-spell-correction-backward)


nnoremap <silent> <Plug>(normal-spell-correction-backward) :<C-u>call <SID>NormalSpellCorrection('backward')<Cr>
nmap <C-s> <Plug>(normal-spell-correction-backward)

nnoremap <silent> <Plug>(normal-spell-correction-forward)  :<C-u>call <SID>NormalSpellCorrection('forward')<Cr>
nmap <C-k> <Plug>(normal-spell-correction-forward)

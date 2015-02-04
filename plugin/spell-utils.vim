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
inoremap <silent> <Plug>(insert-spell-fix-forward)  <C-o>:<C-u>call <SID>InsertSpellCorrection('forward')<Cr>
inoremap <silent> <Plug>(insert-spell-fix-backward) <C-o>:<C-u>call <SID>InsertSpellCorrection('backward')<Cr>
nnoremap <silent> <Plug>(normal-spell-fix-forward)  :<C-u>call <SID>NormalSpellCorrection('forward')<Cr>
nnoremap <silent> <Plug>(normal-spell-fix-backward) :<C-u>call <SID>NormalSpellCorrection('backward')<Cr>

imap <C-k> <Plug>(insert-spell-fix-forward)
imap <C-s> <Plug>(insert-spell-fix-backward)
nmap <C-k> <Plug>(normal-spell-fix-forward)
nmap <C-s> <Plug>(normal-spell-fix-backward)

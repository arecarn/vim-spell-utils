"MAPS {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <silent> <Plug>(insert-spell-fix-forward) <C-o>:<C-u>call spellutils#InsertCorrection('forward')<Cr>
if !hasmapto('<Plug>(insert-spell-fix-forward)')
    imap <C-j> <Plug>(insert-spell-fix-forward)
endif

nnoremap <silent> <Plug>(normal-spell-fix-forward) :<C-u>call spellutils#NormalCorrection('forward')<Cr>
if !hasmapto('<Plug>(normal-spell-fix-forward)')
    nmap <C-j> <Plug>(normal-spell-fix-forward)
endif

inoremap <silent> <Plug>(insert-spell-fix-backward) <C-o>:<C-u>call spellutils#InsertCorrection('backward')<Cr>
if !hasmapto('<Plug>(insert-spell-fix-backward)')
    imap <C-k> <Plug>(insert-spell-fix-backward)
endif

nnoremap <silent> <Plug>(normal-spell-fix-backward) :<C-u>call spellutils#NormalCorrection('backward')<Cr>
if !hasmapto('<Plug>(normal-spell-fix-backward)')
    nmap <C-k> <Plug>(normal-spell-fix-backward)
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}

" vim:foldmethod=marker

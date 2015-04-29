""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Original Author: Ryan Carney
" License: WTFPL
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" BOILER PLATE {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:save_cpo = &cpo
set cpo&vim

if exists("g:loaded_spellutils")
    finish
else
    let g:loaded_spellutils = 1
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}

" MAPPINGS {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <silent> <Plug>(insert-spell-fix-forward) 
            \ <C-g>u<C-o>:<C-u>call spellutils#insert_correction('forward')<CR>
if !hasmapto('<Plug>(insert-spell-fix-forward)')
    imap <C-k> <Plug>(insert-spell-fix-forward)
endif

nnoremap <silent> <Plug>(normal-spell-fix-forward) 
            \ :<C-u>call spellutils#normal_correction('forward')<CR>
if !hasmapto('<Plug>(normal-spell-fix-forward)')
    nmap <C-k> <Plug>(normal-spell-fix-forward)
endif

inoremap <silent> <Plug>(insert-spell-fix-backward) 
            \ <C-g>u<C-o>:<C-u>call spellutils#insert_correction('backward')<CR>
if !hasmapto('<Plug>(insert-spell-fix-backward)')
    imap <C-j> <Plug>(insert-spell-fix-backward)
endif

nnoremap <silent> <Plug>(normal-spell-fix-backward) 
            \ :<C-u>call spellutils#normal_correction('backward')<CR>
if !hasmapto('<Plug>(normal-spell-fix-backward)')
    nmap <C-j> <Plug>(normal-spell-fix-backward)
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}

" BOILER PLATE {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let &cpo = s:save_cpo
unlet s:save_cpo
" vim:foldmethod=marker
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}

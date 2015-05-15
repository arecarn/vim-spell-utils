""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Original Author: Ryan Carney
" License: WTFPL
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""{{{
let s:save_cpo = &cpo
set cpo&vim

if exists("g:loaded_spellutils")
    finish
else
    let g:loaded_spellutils = 1
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}

" GLOBALS {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:spell_utils_default_mapping = get(g:, 'spell_utils_default_mapping', 1)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}

" MAPPINGS {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:do_map(name, lhs, rhs, mode, default_option) abort "{{{2
    let plug = '<Plug>('.a:name.')'
    execute a:mode.'noremap <silent> '.plug.' '.a:rhs
    if a:default_option
        execute a:mode.'map <unique> '.a:lhs.' '.plug
    endif
endfunction "}}}2

call s:do_map(
            \ "insert-spell-fix-forward",
            \ "\<C-l>",
            \ "\<C-g>u\<C-o>:\<C-u>call spellutils#insert_correction('forward')\<CR>",
            \ "i",
            \ g:spell_utils_default_mapping,
            \ )

call s:do_map(
            \ "insert-spell-fix-backward",
            \ "\<C-a>",
            \ "\<C-g>u\<C-o>:\<C-u>call spellutils#insert_correction('backward')\<CR>",
            \ "i",
            \ g:spell_utils_default_mapping,
            \ )

call s:do_map(
            \ "normal-spell-fix-forward",
            \ "]gs",
            \ ":\<C-u>call spellutils#normal_correction('forward')\<CR>",
            \ "n",
            \ g:spell_utils_default_mapping,
            \ )

call s:do_map(
            \ "normal-spell-fix-backward",
            \ "[gs",
            \ ":\<C-u>call spellutils#normal_correction('backward')\<CR>",
            \ "n",
            \ g:spell_utils_default_mapping,
            \ )
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""{{{
let &cpo = s:save_cpo
unlet s:save_cpo
" vim:foldmethod=marker
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}

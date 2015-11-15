""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Original Author: Ryan Carney
" License: WTFPL
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" BOILER PLATE {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:save_cpo = &cpo
set cpo&vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}


" PUBLIC FUNCTIONS {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""{{{
function! spell_utils#insert_correction(direction) abort "{{{2
    if &spell

        let column_position = col('.')
        let line_length =  col('$') - 1

        call s:go_to_bad_word(a:direction, 0)

        sleep 50m
        call s:fix_spelling()
        normal! gi
        sleep 50m

        call s:go_to_old_position(column_position, line_length, a:direction)

    else
        call s:print_spelling_warning_msg()
    endif
endfunction "}}}2


function! spell_utils#normal_correction(direction) abort "{{{2
    if &spell
        call s:go_to_bad_word(a:direction, 1)
        sleep 300m
        redraw
        call s:fix_spelling()
    else
        call s:print_spelling_warning_msg()
    endif
endfunction "}}}2
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}


" PRIVATE FUNCTIONS {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:go_to_old_position(old_column_position, old_line_length, fix_direction) abort "{{{2

    if a:old_column_position == 1
        return
    endif

    let line_length = col('$') - 1
    let length_difference = a:old_line_length - line_length

    if a:fix_direction ==# 'forward' || length_difference == 0
        normal! l

    elseif a:fix_direction ==# 'backward'
        if line_length < a:old_line_length
            if length_difference > 1
                let length_difference = length_difference  -1
                execute 'normal! ' . length_difference . 'h'
            endif

        elseif line_length > a:old_line_length
            execute 'normal! ' abs(length_difference) + 1 . 'l'
        endif
    endif

endfunction "}}}2


function! s:return_operator(direction) abort "{{{2
    if a:direction ==# 'forward'
        return ']s'
    elseif a:direction ==# 'backward'
        return '[s'
    else
        throw "Must use 'forward' or 'backward' as argument"
    endif
endfunction "}}}2

function! s:is_on_bad_word() abort "{{{2
    let return_value = 1
    let window_posotion = winsaveview()
    let column = col('.')

    if spellbadword() == ['','']
        let return_value = 0
    endif

    if col('.') > column
        let return_value = 0
    endif

    call winrestview(window_posotion)
    return return_value
endfunction "}}}2


function! s:go_to_bad_word(direction, include_word_under_cursor) abort "{{{2

    if a:include_word_under_cursor
        if !s:is_on_bad_word()
            execute "normal! ".s:return_operator(a:direction)
        endif
    else
        execute "normal! ".s:return_operator(a:direction)
    endif

endfunction "}}}2


function! s:fix_spelling() abort "{{{2
    normal! 1z=
endfunction "}}}2


function! s:print_spelling_warning_msg() abort "{{{2
    echohl WarningMsg | echo "spelling not enabled" | echohl None
endfunction "}}}2
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}


" BOILER PLATE {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let &cpo = s:save_cpo
unlet s:save_cpo
" vim:foldmethod=marker
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}

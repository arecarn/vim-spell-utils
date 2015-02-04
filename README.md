Usage
-----
spell-utils.vim overrides the following keys by default.

| Mode   | Default Key | `<Plug>` map                               | Description                                                                       |
| ----   | ----------- | ------------------------------------------ | ------------------------------------------------                                  |
| insert | CTRL-K      | `<Plug>(insert-spell-fix-forward) ` | Correct next misspelling forward with 1st suggestion then return to old position  |
| insert | CTRL-S      | `<Plug>(insert-spell-fix-backward)` | Correct next misspelling backward with 1st suggestion then return to old position |
| normal | CTRL-K      | `<Plug>(normal-spell-fix-forward)`  | Correct next spelling mistake forward using first suggestion                      |
| normal | CTRL-S      | `<Plug>(normal-spell-fix-backward)` | Correct next spelling mistake forward using first suggestion                      |

Customization
-------------
Example:
```vim
    imap <leader>k <Plug>(insert-spell-fix-forward)
    imap <leader>s <Plug>(insert-spell-fix-backward)
    nmap <leader>k <Plug>(normal-spell-fix-forward)
    nmap <leader>s <Plug>(normal-spell-fix-backward)
```

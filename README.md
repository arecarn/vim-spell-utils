Usage
-----
| Mode   | Default Key | `<Plug>` map                               | Description                                                                       |
| ----   | ----------- | ------------------------------------------ | ------------------------------------------------                                  |
| insert | CTRL-L      | `<Plug>(insert-spell-fix-forward)`         | Correct next misspelling forward with 1st suggestion then return to old position  |
| insert | CTRL-S      | `<Plug>(insert-spell-fix-backward)`        | Correct next misspelling backward with 1st suggestion then return to old position |
| normal | ]gs         | `<Plug>(normal-spell-fix-forward)`         | Correct next spelling mistake forward using first suggestion                      |
| normal | [gs         | `<Plug>(normal-spell-fix-backward)`        | Correct next spelling mistake backward using first suggestion                     |

Customization
-------------
Example:
```vim
    imap <leader>l <Plug>(insert-spell-fix-forward)
    imap <leader>h <Plug>(insert-spell-fix-backward)
    nmap <leader>l <Plug>(normal-spell-fix-forward)
    nmap <leader>h <Plug>(normal-spell-fix-backward)
```

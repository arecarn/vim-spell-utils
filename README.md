Usage
-----
| Mode   | Default Key | `<Plug>` map                               | Description                                                                       |
| ----   | ----------- | ------------------------------------------ | ------------------------------------------------                                  |
| insert | CTRL-L      | `<Plug>(insert-spell-fix-forward)`         | Correct next misspelling forward with 1st suggestion then return to old position  |
| insert | CTRL-A      | `<Plug>(insert-spell-fix-backward)`        | Correct next misspelling backward with 1st suggestion then return to old position |
| normal | ]gs         | `<Plug>(normal-spell-fix-forward)`         | Correct next spelling mistake forward using first suggestion                      |
| normal | [gs         | `<Plug>(normal-spell-fix-backward)`        | Correct next spelling mistake backward using first suggestion                     |

Demo
----
![demo](https://cloud.githubusercontent.com/assets/2142684/7647220/cf454026-fa85-11e4-8d9a-4c754b9f394b.gif)


Customization
-------------
Example:
```vim
    imap <leader>l <Plug>(insert-spell-fix-forward)
    imap <leader>h <Plug>(insert-spell-fix-backward)
    nmap <leader>l <Plug>(normal-spell-fix-forward)
    nmap <leader>h <Plug>(normal-spell-fix-backward)
```

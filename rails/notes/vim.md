
# Vim Basics

## Opening and Closing Vim

- Open Vim: `vim`
- Open a file: `vim filename`
- Save changes and exit: `:wq` or `ZZ`
- Exit without saving changes: `:q!`

## Modes

- Normal mode: The default mode for navigation and editing.
- Insert mode: For inserting or typing text.
- Visual mode: For selecting text.

## Navigating in Normal Mode

- Move cursor left: `h`
- Move cursor right: `l`
- Move cursor up: `k`
- Move cursor down: `j`
- Move to beginning of line: `0` or `^`
- Move to end of line: `$`
- Go to the beginning of the file: `gg`
- Go to the end of the file: `G`

## Editing in Normal Mode

- Delete a character: `x`
- Delete a line: `dd`
- Undo: `u`
- Redo: `Ctrl-r`

## Entering Insert Mode

- Insert text before cursor: `i`
- Insert text after cursor: `a`
- Insert text at the beginning of the line: `I`
- Append text at the end of the line: `A`
- Open a new line below: `o`
- Open a new line above: `O`

## Visual Mode

- Start visual mode: `v`
- Select text: Navigate to highlight text.
- Copy selected text: `y`
- Cut selected text: `d`
- Paste text: `p`

## Searching and Replacing

- Search forward: `/searchterm`
- Search backward: `?searchterm`
- Find next occurrence: `n`
- Find previous occurrence: `N`
- Replace: `:%s/old/new/g`

## Saving and Quitting

- Save changes: `:w`
- Save changes and quit: `:wq` or `ZZ`
- Quit without saving: `:q!`

## Miscellaneous

- Repeat last command: `.`
- Show line numbers: `:set number`
- Remove line numbers: `:set nonumber`
- Help: `:help`

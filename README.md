# UTCS VIM - Vi IMproved

### The University of Texas at Austin — Department of Computer Science

**Spring 2026 Release**

A customized build of [Vim](https://www.vim.org) for UT Austin Computer
Science students and faculty.  Based on Vim 9.2 with memory bug fixes,
built-in LaTeX support, and the Longhorn (Burnt Orange) default theme.

---

## What's Different from Upstream Vim?

### Longhorn Theme (Burnt Orange Default)
The default colorscheme uses the official UT Austin Burnt Orange (`#BF5700`)
palette.  The status line, tab bar, search highlights, mode messages, and
cursor all use Burnt Orange accents on a dark background.

- **Default on startup** — no configuration needed
- Original Vim colors available via `:colorscheme classic`
- See `:help longhorn` for full details

### LaTeX Compile & View
Built-in support for compiling and viewing LaTeX documents, loaded
automatically for `.tex` files.

| Command           | Shortcut       | Description                              |
|-------------------|----------------|------------------------------------------|
| `:TexCompile`     | `<Leader>ll`   | Compile with pdflatex (errors → quickfix)|
| `:TexCompileFull` | `<Leader>lf`   | Full build: pdflatex + bibtex + pdflatex×2 |
| `:TexView`        | `<Leader>lv`   | Open compiled PDF in system viewer       |
| `:TexClean`       | `<Leader>lc`   | Remove .aux, .log, .toc and other temp files |

Supports multi-file projects via `% !TEX root = main.tex` magic comments.
See `:help tex-utcs` for full documentation.

### Memory Bug Fixes
- Fixed `free()` vs `vim_free()` mismatch in diff.c
- Fixed use-after-free in `copy_function()` type handling
- Fixed NULL pointer crash in `mem_realloc()` (MEM_PROFILE builds)
- Removed duplicate `ResetRedobuff()` call in `free_all_mem()`
- Added integer overflow protection to `ga_grow_inner()`

---

## Quick Start

```bash
# Clone
git clone https://github.com/abdonmorales/vim.git
cd vim/src

# Build
make -j$(nproc)          # Linux
make -j$(sysctl -n hw.ncpu)  # macOS

# Test
./vim                    # see the Longhorn theme + Spring 2026 intro
./vim test.tex           # try :TexCompile (needs pdflatex)

# Install
sudo make install
```

## What is Vim?

Vim is a greatly improved version of the good old UNIX editor
[Vi](https://en.wikipedia.org/wiki/Vi_(text_editor)).  Many new
features have been added: multi-level undo, syntax highlighting, command line
history, on-line help, spell checking, filename completion, block operations,
script language, etc.  There is also a Graphical User Interface (GUI)
available.  Still, Vi compatibility is maintained, those who have Vi "in the
fingers" will feel at home.
See [`runtime/doc/vi_diff.txt`](runtime/doc/vi_diff.txt) for differences with
Vi.

This editor is very useful for editing programs and other plain text files.
All commands are given with normal keyboard characters, so those who can type
with ten fingers can work very fast.  Additionally, function keys can be
mapped to commands by the user, and the mouse can be used.

Vim runs under MS-Windows (7, 8, 10, 11), macOS, Haiku, VMS and almost all
flavours of UNIX.  Porting to other systems should not be very difficult.

For Vim9 script see [README_VIM9](README_VIM9.md).

## Compiling

If you obtained a binary distribution you don't need to compile Vim.  If you
obtained a source distribution, all the stuff for compiling Vim is in the
[`src`](./src/) directory.  See [`src/INSTALL`](./src/INSTALL) for instructions.

## Installation

See one of these files for system-specific instructions.  Either in the
[READMEdir directory](./READMEdir/) (in the repository) or
the top directory (if you unpack an archive):

```
README_ami.txt      Amiga
README_unix.txt     Unix
README_dos.txt      MS-DOS and MS-Windows
README_mac.txt      Macintosh
README_haiku.txt    Haiku
README_vms.txt      VMS
```

There are other `README_*.txt` files, depending on the distribution you used.

## Documentation

The Vim tutor is a one hour training course for beginners.  Often it can be
started as `vimtutor`.  See `:help tutor` for more information.

The best is to use `:help` in Vim.  If you don't have an executable yet, read
[`runtime/doc/help.txt`](./runtime/doc/help.txt).
It contains pointers to the other documentation files.
The User Manual reads like a book and is recommended to learn to use
Vim.  See `:help user-manual`.

UTCS-specific documentation:
- `:help tex-utcs` — LaTeX compile and view commands
- `:help longhorn` — Longhorn colorscheme and UT theming

## Copying

Vim is Charityware.  You can use and copy it as much as you like, but you are
encouraged to make a donation to help orphans in Uganda.  Please read the file
[`runtime/doc/uganda.txt`](./runtime/doc/uganda.txt)
for details (do `:help uganda` inside Vim).

Summary of the license: There are no restrictions on using or distributing an
unmodified copy of Vim.  Parts of Vim may also be distributed, but the license
text must always be included.  For modified versions, a few restrictions apply.
The license is GPL compatible, you may compile Vim with GPL libraries and
distribute it.

## Sponsoring

Fixing bugs and adding new features takes a lot of time and effort.  To show
your appreciation for the work and motivate developers to continue working on
Vim please send a donation.

The money you donated will be mainly used to help children in Uganda.  See
[`runtime/doc/uganda.txt`](./runtime/doc/uganda.txt).  But at the same time
donations increase the development team motivation to keep working on Vim!

For the most recent information about sponsoring look on the Vim web site:
	https://www.vim.org/sponsor/

## Contributing

If you would like to help make Vim better, see the
[CONTRIBUTING.md](./CONTRIBUTING.md) file.

## Information

If you are on macOS, you can use [MacVim](https://macvim.org).

The latest news about Vim can be found on the Vim home page:
	https://www.vim.org/

If you have problems, have a look at the Vim documentation or tips:
	https://www.vim.org/docs.php
	https://vim.fandom.com/wiki/Vim_Tips_Wiki

If you still have problems or any other questions, use one of the mailing
lists to discuss them with Vim users and developers:
	https://www.vim.org/maillist.php

## Credits

Vim was created by Bram Moolenaar `<Bram@vim.org>`.
[Bram-Moolenaar](https://vimhelp.org/version9.txt.html#Bram-Moolenaar)

UTCS Vim maintained by Abdon Morales `<abdonm@cs.utexas.edu>`.

This is `README.md` for UTCS Vim 9.2 — Spring 2026 Release.

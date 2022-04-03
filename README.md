# circadian.vim

A fork adamnsch's [circadian.vim](https://github.com/adamnsch/vim-circadian)
with some added custom functionality for my use-case.

Small plugin that lets one set a time of day for automatically switching between
two specified themes (typically a light and dark theme).

## Requirements

This plugin requires a version of Neovim or Vim that supports timers.
For Vim this means versions >= 7.4.1578.

## Installation

Install with your favorite vim plugin manager. For example using plug:
```vim
Plug 'adamnsch/vim-circadian'
```

## Customizing

### Time of day

By default the plugin will apply the daytime theme from 8 AM to 7 PM.
This can be overridden the following way:

```vim
let g:circadian_day_start = 10
let g:circadian_night_start = 20
```

Note that "military time" is used to encode 8 PM as `20` here.

### Specifying themes

~~By default the plugin will just `set background` to `light` and `dark` for day
and night time respectively.~~ [The background is no longer updated in this
version, instead relying on a custom command to change variables].

Specify `colorscheme`s that should be used the following way:

```vim
let g:circadian_day_theme = 'onehalflight'
let g:circadian_night_theme = 'onehalfdark'
```

### Specifying Commands

This modified version of circadian.vim allows the user to execute an arbitrary
command and/or set of command with command chaining. The custom command will
always be executed before the theme is modified with `colorscheme`.

Custom commands should be specified the following way:

```vim
let g:circadian_day_cmds = "let x='somevalue'"
let g:circadian_night_cmds = "let x='someothervalue'"
```

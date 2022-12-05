# Noirbuddy

A monochrome colorscheme for neovim, that is highly configurable.
*TODO* -> write a better introduction

## Installation

Noirbuddy is using [colorbuddy.nvim](https://github.com/tjdevries/colorbuddy.nvim) under the hood, so it takes it as a dependency:

If you're using [Packer](https://github.com/wbthomason/packer.nvim), you can do the following:

```lua
use {
    "jesseleite/nvim-noirbuddy",
    requires = { "tjdevries/colorbuddy.nvim", branch = "dev" }
}
```

Then in your lua config, you can simply do:

```lua
require("noirbuddy").setup()
```

## Example Configuration

You can change any (or all) of the colors below:

```lua
require("noirbuddy").setup{
  primary = '#ff0088',
  secondary = '#a7a7a7',
  diagnostic_error = '#EC0034',
  diagnostic_warning = '#ff7700',
  diagnostic_info = '#d5d5d5',
  diagnostic_hint = '#f5f5f5',
  diff_add = '#f5f5f5',
  diff_change = '#737373',
  diff_delete = '#EC0034',
}
```

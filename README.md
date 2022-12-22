# Noirbuddy

A highly customizable minimalist monochromatic colorscheme for Neovim 🖤

Built on [colorbuddy.nvim](https://github.com/tjdevries/colorbuddy.nvim), with a monochromatic base palette, and the ability to set a flavor color or two 💅

- [Installation](#installation)
- [Selecting Presets](#selecting-presets)
- [Customizing Your Theme](#customizing-your-theme)
- [Customizing Semantic Colors](#customizing-semantic-colors)
- [Customizing Highlight Groups](#customizing-highlight-groups)
- [Exporting Colors](#exporting-colors)
- [Thank You](#thank-you)

## Installation

1. Install using your favourite package manager:

    > ***Note:** You'll need to use colorbuddy's `dev` branch for now, but that'll change to `master` in time...*

    **Using [packer.nvim](https://github.com/wbthomason/packer.nvim):**

    ```lua
    use {
      "jesseleite/nvim-noirbuddy",
      requires = { "tjdevries/colorbuddy.nvim", branch = "dev" }
    }
    ```

    **Using [vim-plug](https://github.com/junegunn/vim-plug):**

    ```vim
    Plug 'tjdevries/colorbuddy.nvim', { 'branch': 'dev' }
    Plug 'jesseleite/nvim-noirbuddy'
    ```

2. Enable the colorscheme in your lua config:

    ```lua
    require("noirbuddy").setup()
    ```

3. Order pizza! 🍕 🤘 😎

## Selecting Presets

The default `minimal` preset consists of a monochromatic grayscale palette with one sexy `primary` color.

You can select from one of the bundled [presets](https://github.com/jesseleite/nvim-noirbuddy/tree/master/lua/noirbuddy/presets) like so:

```lua
require('noirbuddy').setup {
  preset = 'miami-nights',
}
```

## Customizing Your Theme

You can configure a custom `primary` color like so:

```lua
require('noirbuddy').setup {
  colors = {
    primary = '#6EE2FF',
  },
}
```

For a more duotone look, you can configure a `secondary` color:

```lua
require('noirbuddy').setup {
  colors = {
    primary = '#6EE2FF',
    secondary = '#267FB5',
  },
}
```

You can also customize the `background` color:

```lua
require('noirbuddy').setup {
  colors = {
    background = '#18181A',
  },
}
```

Or even the base grayscale palette:

```lua
require("noirbuddy").setup {
  colors = {
    black = '#121212',
    gray_9 = '#212121',
    gray_8 = '#323232',
    gray_7 = '#535353',
    gray_6 = '#737373',
    gray_5 = '#949494',
    gray_4 = '#a7a7a7',
    gray_3 = '#b4b4b4',
    gray_2 = '#d5d5d5',
    gray_1 = '#f5f5f5',
    white = '#ffffff',
  },
}
```

## Customizing Semantic Colors

You may wish to configure specific colors for things that have semantic meaning (ie. red for errors, orange for warnings, etc.), in a way that won't change as you switch between [presets](#selecting-presets):

```lua
require("noirbuddy").setup {
  colors = {
    diagnostic_error = '#EC0034',
    diagnostic_warning = '#ff7700',
    diagnostic_info = '#d5d5d5',
    diagnostic_hint = '#f5f5f5',
    diff_add = '#f5f5f5',
    diff_change = '#737373',
    diff_delete = '#EC0034',
  },
}
```

## Customizing Highlight Groups

Since Noirbuddy is built on [colorbuddy.nvim](https://github.com/tjdevries/colorbuddy.nvim), you can use its API to customize specific highlight groups as needed:

```lua
-- Require colorbuddy...
local Color, colors, Group, groups, styles = require('colorbuddy').setup {}

-- Override specific highlight groups...
Group.new('TelescopeTitle', colors.primary)
Group.new('TelescopeBorder', colors.secondary)
Group.new('CursorLineNr', colors.primary, colors.gray_9)
Group.new('Searchlight', nil, colors.secondary)
Group.new('@comment', colors.gray_7)
Group.new('@punctuation', colors.gray_2)
Group.new('@constant', colors.gray_2)

-- Link highlight groups...
Group.link('SignifySignAdd', groups.DiffAdd)
Group.link('SignifySignChange', groups.DiffChange)
Group.link('SignifySignDelete', groups.DiffDelete)

-- etc.
```

## Exporting Colors

If you need access to Noirbuddy's raw color codes for other plugin configs:

```lua
-- Export noirbuddy colors...
local noirbuddy = require('noirbuddy.colors').all()

-- Outputs a simple lua table...
-- {
--   primary = "#e4609b",
--   secondary = "#47bac0",
--   background = "#18181a",
--   gray0 = "#282c34",
--   gray1 = "#282a2e",
--   gray2 = "#373b41",
--   -- etc.
-- }
```

You can run `:lua print(vim.inspect(require('noirbuddy.colors').all()))` to see a full list of what is exported.

## Thank You!

- [Dimitar Dimitrov](https://twitter.com/dimitrov2k) for your contributions, slick ideas, and teamwork (this project is actually a spiritual successor to his awesome [noirblaze](https://github.com/n1ghtmare/noirblaze-vim) colorscheme) 💪

- [TJ DeVries](https://twitter.com/teej_dv) for your incredible work on [colorbuddy.nvim](https://github.com/tjdevries/colorbuddy.nvim) (and all things Neovim for that matter) 🤘

    ![](https://media.giphy.com/media/VgeGEVTdwzZao/giphy.gif)

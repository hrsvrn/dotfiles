return {
  "xiyaowong/transparent.nvim",
  lazy = false, -- Load at startup to ensure transparency everywhere
  config = function()
    require("transparent").setup({
      groups = { -- Default groups to clear background for
        "Normal", "NormalNC", "Comment", "Constant", "Special", "Identifier",
        "Statement", "PreProc", "Type", "Underlined", "Todo", "String",
        "Function", "Conditional", "Repeat", "Operator", "Structure",
        "LineNr", "NonText", "SignColumn", "CursorLine", "CursorLineNr",
        "StatusLine", "StatusLineNC", "EndOfBuffer",
      },
      extra_groups = { -- Add plugin/UI groups here
        "NeoTreeNormal", "NeoTreeNormalNC",
        -- Add more if you use other sidebars or plugins with custom backgrounds
      },
      exclude_groups = {}, -- Groups to keep opaque (leave empty for full transparency)
    })

    -- Clear background for all highlight groups starting with these prefixes
    require('transparent').clear_prefix('BufferLine')
    require('transparent').clear_prefix('NeoTree')
  end,
}


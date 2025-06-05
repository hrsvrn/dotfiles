return {
  "folke/tokyonight.nvim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require("tokyonight").setup({
      style = "night", -- or "storm", "moon", "day"
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      -- You can add other options here if needed
    })
    vim.cmd.colorscheme("tokyonight")
  end,
}


require 'core.options'
require 'core.keymaps'
require("colors.terminal")
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
-- Store individual states
local diagnostic_state = {
  virtual_text = false,
  signs = false,
  underline = false,
}

local function toggle_diagnostics()
  -- Toggle all states
  for key, _ in pairs(diagnostic_state) do
    diagnostic_state[key] = not diagnostic_state[key]
  end
  
  vim.diagnostic.config({
    virtual_text = diagnostic_state.virtual_text,
    signs = diagnostic_state.signs,
    underline = diagnostic_state.underline,
    update_in_insert = false, -- Keep this always false
  })
  
  local status = diagnostic_state.virtual_text and "enabled" or "disabled"
  print("Diagnostics " .. status)
end

-- Initialize with your default settings
vim.diagnostic.config({
  virtual_text = false,
  signs = false,
  underline = false,
  update_in_insert = false,
})

-- Set up keybinding
vim.keymap.set('n', '<C-w>', toggle_diagnostics, { desc = 'Toggle diagnostics' })

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)
require('lazy').setup({
require'plugins.neotree',
require 'plugins.colorscheme',
require 'plugins.autoclose',
require 'plugins.bufferline',
require 'plugins.lualine',
require 'plugins.treesitter',
require 'plugins.telescope',
require 'plugins.lsp',
require 'plugins.autocompletion',
require 'plugins.gitsigns',
require 'plugins.misc',
require 'plugins.transparency',
require 'plugins.snacks'
})

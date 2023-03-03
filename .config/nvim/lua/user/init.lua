-- https://github.com/AstroNvim/AstroNvim/blob/main/lua/user_example/init.lua
local config = {
  mappings = {
--     -- first key is the mode
--     n = {
--       -- second key is the lefthand side of the map
--       -- mappings seen under group name "Buffer"
--       ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
--       ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
--       ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
--       ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
--       -- quick save
--       -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
--     },
--     t = {
--       -- setting a mapping to false will disable it
--       -- ["<esc>"] = false,
--     },
  },
  plugins = {
    init = {
      ["rafamadriz/friendly-snippets"] = { event = { nil } },
    },
  },
  -- set vim options here (vim.<first_key>.<second_key> = value)
  options = {
    opt = {
      -- set to true or false etc.
      relativenumber = true, -- sets vim.opt.relativenumber
      number = true, -- sets vim.opt.number
      spell = false, -- sets vim.opt.spell
      signcolumn = "auto", -- sets vim.opt.signcolumn to auto
      wrap = false, -- sets vim.opt.wrap
    },
    g = {
      mapleader = " ", -- sets vim.g.mapleader
      autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
      cmp_enabled = true, -- enable completion at start
      autopairs_enabled = true, -- enable autopairs at start
      diagnostics_enabled = true, -- enable diagnostics at start
      status_diagnostics_enabled = true, -- enable diagnostics in statusline
      icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
      ui_notifications_enabled = true, -- disable notifications when toggling UI elements
      heirline_bufferline = false, -- enable new heirline based bufferline (requires :PackerSync after changing)
    },
  },
  polish = function()
--     vim.api.nvim_create_autocmd("VimEnter", {
--       command = "Neotree toggle",
--     })
--     vim.api.nvim_create_autocmd("BufEnter", {
--       command = "set rnu nu",
--     })
  end,
}

return config

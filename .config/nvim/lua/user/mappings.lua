return {
  n = {
    -- terminal
    ["<A-i>"] = { "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle floating terminal" },
    ["<A-H>"] = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "Toggle horizontal terminal" },
    ["<A-V>"] = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "Toggle vertical terminal" },
  },  
  t = {
    ["<A-i>"] = { "<cmd>ToggleTerm direction=float<cr>", desc = "toggle floating terminal" },
    ["<A-H>"] = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "toggle horizontal terminal" },
    ["<A-V>"] = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "toggle vertical terminal" },
  },
}

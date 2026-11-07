return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",     -- load on insert mode
  opts = {
    enable_moveright = true, -- move past closing bracket if you type it
    map_cr = true,           -- map <CR> to behave nicely inside pairs
    map_bs = true,           -- map backspace to delete both chars
  },
}

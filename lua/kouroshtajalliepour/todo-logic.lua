-- NEW TASK (go to bottom + insert)
vim.keymap.set("n", "<leader>tn", function()
  vim.cmd("normal! Go[ ] ")
  vim.cmd("startinsert!")
end, { desc = "Todo: new task" })

-- MARK DONE (force [x])
vim.keymap.set("n", "<leader>tx", function()
  vim.cmd("normal! ^f[lrx")
end, { desc = "Todo: mark done" })

-- MARK OPEN / CANCEL (force [ ])
vim.keymap.set("n", "<leader>tc", function()
  vim.cmd("normal! ^f[lr ")
end, { desc = "Todo: mark open" })

-- TOGGLE (smart switch [ ] ↔ [x])
vim.keymap.set("n", "<leader>tt", function()
  local line = vim.api.nvim_get_current_line()

  if line:match("%[ %]") then
    line = line:gsub("%[ %]", "[x]")
  elseif line:match("%[x%]") then
    line = line:gsub("%[x%]", "[ ]")
  end

  vim.api.nvim_set_current_line(line)
end, { desc = "Todo: toggle task" })

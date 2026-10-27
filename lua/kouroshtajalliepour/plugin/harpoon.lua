return {
  "ThePrimeagen/harpoon",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>a", ":lua require('harpoon.mark').add_file()<CR>", desc = "Add file to Harpoon" },
    { "<leader>m", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", desc = "Toggle Harpoon menu" },
    { "<leader>1", ":lua require('harpoon.ui').nav_file(1)<CR>", desc = "Harpoon file 1" },
    { "<leader>2", ":lua require('harpoon.ui').nav_file(2)<CR>", desc = "Harpoon file 2" },
    { "<leader>3", ":lua require('harpoon.ui').nav_file(3)<CR>", desc = "Harpoon file 3" },
    { "<leader>4", ":lua require('harpoon.ui').nav_file(4)<CR>", desc = "Harpoon file 4" },
    { "<leader>5", ":lua require('harpoon.ui').nav_file(5)<CR>", desc = "Harpoon file 5" },
    { "<leader>6", ":lua require('harpoon.ui').nav_file(6)<CR>", desc = "Harpoon file 6" },
    { "<leader>7", ":lua require('harpoon.ui').nav_file(7)<CR>", desc = "Harpoon file 7" },
    { "<leader>8", ":lua require('harpoon.ui').nav_file(8)<CR>", desc = "Harpoon file 8" },
    { "<leader>9", ":lua require('harpoon.ui').nav_file(9)<CR>", desc = "Harpoon file 9" },
  },
  config = function()
    local ui = require("harpoon.ui")

    -- Optional: keymaps for next/prev file in Harpoon list
    vim.keymap.set("n", "<leader>]", function() ui.nav_next() end, { desc = "Next Harpoon file" })
    vim.keymap.set("n", "<leader>[", function() ui.nav_prev() end, { desc = "Previous Harpoon file" })
  end,
}

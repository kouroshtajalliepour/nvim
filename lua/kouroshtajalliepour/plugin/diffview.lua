return {
  "sindrets/diffview.nvim",
  dependencies = "nvim-lua/plenary.nvim",
  config = function()
    require("diffview").setup({
      -- Optional settings
      enhanced_diff_hl = true, -- Highlight word differences
      git_cmd = { "git" },    -- Which git executable to use
      use_icons = true,       -- Show icons
      signs = {
        fold_closed = "▸",
        fold_open = "▾",
      },
      view = {
        -- Default layout for diff view
        default = {
          layout = "diff2_horizontal",
          winbar_info = true,
        },
        merge_tool = {
          layout = "diff3_horizontal",
          disable_diagnostics = true,
        },
      },
    })

    -- Optional: keymaps for opening diffview
    vim.keymap.set("n", "<leader>do", "<cmd>DiffviewOpen<cr>", { desc = "Open Diffview" })
    vim.keymap.set("n", "<leader>dc", "<cmd>DiffviewClose<cr>", { desc = "Close Diffview" })
    vim.keymap.set("n", "<leader>df", "<cmd>DiffviewFileHistory %<cr>", { desc = "File history" })
    vim.keymap.set("n", "<leader>dh", "<cmd>DiffviewFileHistory<cr>", { desc = "History" })
  end,
}

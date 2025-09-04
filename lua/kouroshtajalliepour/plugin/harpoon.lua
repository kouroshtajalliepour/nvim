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
	},
	config = function()
		local harpoon = require("harpoon")
		local ui = require("harpoon.ui")
		local mark = require("harpoon.mark")

		-- Optional: keymaps for next/prev file in Harpoon list
		vim.keymap.set("n", "<leader>]", function() ui.nav_next() end, { desc = "Next Harpoon file" })
		vim.keymap.set("n", "<leader>[", function() ui.nav_prev() end, { desc = "Previous Harpoon file" })
	end,
}

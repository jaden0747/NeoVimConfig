local telescope = require('telescope')
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<A-k>"] = actions.move_selection_previous, -- move to prev result
				["<A-j>"] = actions.move_selection_next, -- move to next result
				["<A-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
			}
		}
	}
})
	

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)



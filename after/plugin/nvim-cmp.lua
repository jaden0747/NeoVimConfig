local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
	completion = {
		completeopt = "menu, menuone, preview, noselect",
	},
	snippet = { -- configure how nvim-cmp interacts with snippet engine
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<A-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
		["<A-j>"] = cmp.mapping.select_next_item(), -- next suggestion
		["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
		["<C-c>"] = cmp.mapping.abort(), -- close completion window
		["<CR>"] = cmp.mapping.confirm({select = false}),
	}),
})

print("nvim-cmp setup complete")

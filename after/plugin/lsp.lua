local lspconfig = require('lspconfig')

-- Define your on_attach function
local custom_on_attach = function(client, bufnr)
	local caps = client.server_capabilities
	if caps.semanticTokensProvider and caps.semanticTokensProvider.full then
		local augroup = vim.api.nvim_create_augroup("SemanticTokens", {})
		vim.api.nvim_create_autocmd("TextChanged", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.semantic_tokens_full()
			end,
		})
		-- fire it first time on load as well
		vim.lsp.buf.semantic_tokens_full()
	end	
	-- require'completion'.on_attach(client)
	-- require'diagnostic'.on_attach(client)
	
end

-- Setup clangd with custom on_attach function
lspconfig.clangd.setup {
    on_attach = custom_on_attach,
    cmd = { "clangd", "--compile-commands-dir=./build" },
}

vim.keymap.set('n','gD','<cmd>lua vim.lsp.buf.declaration()<CR>')
vim.keymap.set('n','gd','<cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n','K','<cmd>lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n','gr','<cmd>lua vim.lsp.buf.references()<CR>')
vim.keymap.set('n','gs','<cmd>lua vim.lsp.buf.signature_help()<CR>')
vim.keymap.set('n','gi','<cmd>lua vim.lsp.buf.implementation()<CR>')
vim.keymap.set('n','gt','<cmd>lua vim.lsp.buf.type_definition()<CR>')
vim.keymap.set('n','<leader>gw','<cmd>lua vim.lsp.buf.document_symbol()<CR>')
vim.keymap.set('n','<leader>gW','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
vim.keymap.set('n','<leader>ah','<cmd>lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n','<leader>af','<cmd>lua vim.lsp.buf.code_action()<CR>')
vim.keymap.set('n','<leader>ee','<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>')
vim.keymap.set('n','<leader>ar','<cmd>lua vim.lsp.buf.rename()<CR>')
vim.keymap.set('n','<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>')
vim.keymap.set('n','<leader>ai','<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
vim.keymap.set('n','<leader>ao','<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')

local options = {
  ensure_installed = { "texlab", "clangd", "sumneko_lua" },
}

require("mason-lspconfig").setup(options)

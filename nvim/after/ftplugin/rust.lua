vim.pack.add({
	"https://github.com/mrcjkb/rustaceanvim",
})

vim.g.rustaceanvim = {
	server = {
		settings = {
			["rust-analyzer"] = {
				checkOnSave = {
					enable = false,
				},
			},
		},
	},
}

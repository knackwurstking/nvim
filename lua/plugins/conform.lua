return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			templ = { "templ", "goimports" },
			go = { "gofmt", "goimports" },
			html = {},
		},
	},
}

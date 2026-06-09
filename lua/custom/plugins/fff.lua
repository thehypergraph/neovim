-- fff.nvim: fast fuzzy file picker (Rust-backed)
-- https://github.com/dmtrKovalenko/fff
return {
	"dmtrKovalenko/fff.nvim",
	build = function()
		-- downloads a prebuilt binary, falling back to `cargo build` if needed
		require("fff.download").download_or_build_binary()
	end,
	-- NixOS users: replace the build line above with `build = "nix run .#release"`
	lazy = false, -- the plugin self-initializes
	opts = {},
	-- Namespaced under <leader>F (capital, for FFF). <leader>f is the format
	-- key and bare ff/fg would slow the `f` motion, so neither is used here.
	keys = {
		{ "<leader>Ff", function() require("fff").find_files() end, desc = "[F]ff: [F]ind files" },
		{ "<leader>Fg", function() require("fff").live_grep() end, desc = "[F]ff: by [G]rep" },
		{ "<leader>Fz", function() require("fff").live_grep({ grep = { modes = { "fuzzy", "plain" } } }) end, desc = "[F]ff: fu[Z]zy grep" },
		{ "<leader>Fc", function() require("fff").live_grep({ query = vim.fn.expand("<cword>") }) end, desc = "[F]ff: [C]urrent word" },
	},
}

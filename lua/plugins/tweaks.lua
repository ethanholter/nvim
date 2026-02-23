return {
    {
	"karb94/neoscroll.nvim",
	opts = {
	    duration_multiplier = 0.25,
	},
    },
    {
	'lambdalisue/vim-suda',
	init = function()
	    vim.g.suda_smart_edit = 1
	end,
    },
    {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
	    preset = "modern" 
	},
	keys = {
	    {
		"<leader>?",
		function()
		    require("which-key").show({ global = true})
		end,
		desc = "Buffer Local Keymaps (which-key)",
	    },
	},
    }
}

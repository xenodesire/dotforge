return {
    "saghen/blink.cmp",
    enabled = true,
        
    --   build = function()
    --     require("blink.cmp").build():pwait()
    --    end, 
    -- In case there are breaking changes and you want to go back to the last
    -- working release
    -- https://github.com/Saghen/blink.cmp/releases
    -- version = "v0.13.1",
    
  dependencies = {
      "saghen/blink.lib",
  },
  version = "*",
    
  opts = {
    fuzzy = { implementation = "rust" },

    completion = {
      list = {
	selection = { preselect = false, auto_insert = true },
	  max_items = 250,
	},
      
      documentation = { 
	auto_show = true, 
	auto_show_delay_ms = 300
      },
      
      menu = {
	auto_show = true,
	scrollbar = false,
	auto_show = true,
	min_width = 75,
	max_height = 40,

	draw = {
	  padding = { 0, 1 },
            gap = 2,
              columns = {
                  { 'kind_icon', 'kind', gap = 1 },
                      { 'label', 'label_description', gap = 1 },
                },
            },
        },
     },

    sources = {
     default = { 'lsp', 'path', 'snippets', 'buffer' }, 
    },
  },
}

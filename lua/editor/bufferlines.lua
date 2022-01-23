require('bufferline').setup({
	options = {
		numbers = "ordinal",
		close_command = "bd! %d",
		right_mouse_command = "bd! %d",
		middle_mouse_command = nil,
		name_formatter = function(buf)
			if buf.name:match('%.md') then
				return vim.fn.fnamemodify(buf.name,':t:r')
			end
		end,
		nax_name_length = 20,
		max_prefix_length = 20,
		tab_size = 20,
		buffer_close_icon = '柳',
		modified_icon = '',
		diagnostics = 'nvim-lsp',
		diagnostics_update_in_insert = true,
		diagnostics_indicator = function(count,level,diagnostics_dict,context)
			return "("..count..")"
		end,
		show_buffer_icons = true,
		separator_style = "slant",
		always_show_bufferline = true,
		sort_by = "id",
	-- groups  = {
	-- 	options = {
	-- 		toggle_hidden_on_enter = true,
	-- 	},
	-- 	items = {
	-- 		name = "Tests",
	-- 		hightlight = {gui = "underline",guisp ="blue"},
	-- 		priority = 2,
	-- 		matcher = function(buf)
	-- 			return buf.filename:match('%_test') or buf.filename:match('%_spec')
	-- 		end,
	-- 	},
	-- 	{
	-- 		name = "Docs",
	-- 		hightlight  = {gui = "undercurl",guisp ="green"},
	-- 		auto_close = false,
	-- 		matcher = function(buf)
	-- 			return buf.filename:match('%.md') or buf.filename:match('%.txt')
	-- 		end,
	-- 		separator = {
	-- 			style = require('bufferline.groups').separator.tab
	-- 		},
	-- 	},
	-- },
	groups = {
	  options = {
	    toggle_hidden_on_enter = true
    	},
	  items = {
	    {
	      name = "Tests",
	      highlight = {gui = "underline", guisp = "blue"}, -- Optional
	      priority = 2, 	      icon = "", -- Optional
	      matcher = function(buf) -- Mandatory
		return buf.filename:match('%_test') or buf.filename:match('%_spec')
	      end,
	    },
	    {
	      name = "Docs",
	      highlight = {gui = "undercurl", guisp = "green"},
	      auto_close = false,
	      matcher = function(buf)
		return buf.filename:match('%.md') or buf.filename:match('%.txt')
	      end,
	      separator = { -- Optional
		style = require('bufferline.groups').separator.tab
	      },
	    }
  	}
},
	offsets = {
	  {
	    filetype = "Outline",
	    text = "Outline",
	    highlight = "Directory",
	    text_align = "left"
	  },
	  {
		  filetype = "NvimTree",
		  text = "Explorer",
		  highlight = "Directory",
		  text_align = "left"
	  },
	  {
		  filetype = "minimap",
		  text = "Minimap",
		  highlight = "Directory",
		  text_align = "left"
	  }
	  }
}
})



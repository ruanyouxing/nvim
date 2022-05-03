require("nvim-treesitter.configs").setup {
   ensure_installed = 'all',
   sync_install = true,

   ignore_install = {"beancount","d","dart","elm","erlang","fennel","foam","fortran","glsl","glimmer","hcl","gdresource","hjson","julia","kotlin","ledger","ocaml","ocaml_interface","ocamllex","pascal","pioasm","prisma","pug","scala","supercollider","surface","teal","tlaplus","turtle","verilog","yang","zig","r","rasi","sparql","swift","gomod","gowork","gdscript","go","fusion","devicetree","cuda","commonlisp","clojure","cmake","c_sharp","graphql","heex","svelte","vue","vim","godot_resource","nix","fish","llvm","ninja","perl","scss","tsx","elixir","make","ruby","ql","query",},
    highlight = {
	    enable = true,
    },
    rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
    },
    autotag = {
	    enable = true,
	    filetypes = {"html","xml"},
    },
    matchup = {
	    enable = true,
    },
    refactor = {
	    highlight_definitions = {enable = true},
	    highlight_current_scope = {enable = true},
	    smart_rename = {
	      enable = true,
	      keymaps = {
		smart_rename = "grr",
	      },
	    },
	navigation = {
	      enable = true,
	      keymaps = {
		goto_definition = "gnd",
		list_definitions = "gnD",
		list_definitions_toc = "gO",
		goto_next_usage = "<a-*>",
		goto_previous_usage = "<a-#>",
	 },
    },
    }
}

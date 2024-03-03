{ ... }:

{
  programs.nixvim =
  {
    # Set leader to space
    globals.mapleader = " ";

    keymaps =
    [
      # Toggle neo-tree 
      {
	key = "<leader>e";
	lua = true;
	action =
	''
	  function()
	    require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
	  end
	'';
	options.desc = "Explorer NeoTree (cwd)";
      }
    ];
  };
}

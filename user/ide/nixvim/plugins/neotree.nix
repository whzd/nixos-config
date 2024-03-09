{ ... }:

{
  programs.nixvim =
  {
    plugins.neo-tree =
    {
      enable = true;
    };

    keymaps =
    [
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

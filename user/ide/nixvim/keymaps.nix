{ ... }:

{
  programs.nixvim =
  {
    # Set leader to space
    globals.mapleader = " ";

    keymaps =
    [
      # Quit
      {
      mode = "n";
      key = "<leader>qq";
      action = "<cmd>qa<cr>";
      options =
	{
	  desc = "Quit all";
	};
      }
      # Move to window using the <ctrl> hjkl keys
      {
	mode = "n";
	key = "<C-h>";
	action = "<C-w>h";
	options =
	{
	  desc = "Go to left window";
	  remap = true;
	};
      }
      {
	mode = "n";
	key = "<C-j>";
	action = "<C-w>j";
	options =
	{
	  desc = "Go to lower window";
	  remap = true;
	};
      }
      {
	mode = "n";
	key = "<C-k>";
	action = "<C-w>k";
	options =
	{ 
	  desc = "Go to upper window";
	  remap = true;
	};
      }
      {
	mode = "n";
	key = "<C-l>";
	action = "<C-w>l";
	options =
	{
	  desc = "Go to right window";
	  remap = true;
	};
      }
    ];
  };
}

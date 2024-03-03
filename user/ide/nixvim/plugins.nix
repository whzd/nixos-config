{ ... }:

{
  programs.nixvim =
  {
    plugins =
    {
      # Improved highlighting
      treesitter =
      {
        enable = true;
      };
      # Statusline
      lualine =
      {
        enable = true;
	globalstatus = true;
      };
      #File explorer
      neo-tree =
      {
        enable = true;
      };
    };
  };
}

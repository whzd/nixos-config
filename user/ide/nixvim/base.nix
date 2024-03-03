{ 
  helpers,
  pkgs,
  ...
}:

{
  home.packages = with pkgs;
  [
    wl-clipboard
  ];
  programs.nixvim =
  {
    enable = true;

    options =
    {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
    };

    clipboard.register = "unnamed,unnamedplus";
    clipboard.providers =
    {
      wl-copy.enable = true;
      wl-copy.package = pkgs.wl-clipboard;
    };
  };
}

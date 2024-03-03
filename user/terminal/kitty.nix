{ pkgs, userSettings, ... }:

{
  home.packages = with pkgs; [
    kitty
  ];

  programs.kitty =
  {
    enable = true;
    theme = "Everforest Dark Soft";
    font =
    {
      name = userSettings.font;
      package = userSettings.fontPkg;
      size = 13;
    };
  };
}

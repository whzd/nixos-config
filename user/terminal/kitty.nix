{ pkgs, userSettings, ... }:

{
  home.packages = with pkgs; [
    kitty
  ];

  programs.kitty =
  {
    enable = true;
    themeFile = "everforest_dark_soft";
    font =
    {
      name = userSettings.font;
      package = userSettings.fontPkg;
      size = 13;
    };
  };
}

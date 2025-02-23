{ pkgs, userSettings, stylix, ... }:

{
  home.username = userSettings.username;
  home.homeDirectory = "/home/" + userSettings.username;

  programs.home-manager.enable = true;

  imports =
    [
      stylix.homeManagerModules.stylix
      ../../user/themes/stylix.nix
      ../../user/wm/hyprland
      ../../user/shell/zsh.nix
      ../../user/shell/starship.nix
      ../../user/terminal/kitty.nix
      ../../user/terminal/tmux.nix
      ../../user/ide/nixvim
      ../../user/work
    ];

  # The state version is required and should stay at the version you
  # originally installed.
  home.stateVersion = "23.11";

  home.packages = with pkgs;
    [
      zsh
      zip
      sxiv
      kitty
      unzip
      zathura
      firefox
      neofetch
      obsidian
      hyprpaper
      spotifywm
      xfce.thunar
      teams-for-linux
    ];
  
  home.sessionVariables = {
    EDITOR = userSettings.editor;
  };
}

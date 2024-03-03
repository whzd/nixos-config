{ config, pkgs, userSettings, stylix, ... }:

{
  home.username = userSettings.username;
  home.homeDirectory = "/home/" + userSettings.username;

  programs.home-manager.enable = true;

  imports =
    [
      stylix.homeManagerModules.stylix
      ../../user/themes/stylix.nix
      ../../user/wm/hyprland/hyprland.nix
      ../../user/wm/hyprland/wlogout.nix
      ../../user/wm/hyprland/waybar.nix
      ../../user/wm/hyprland/swaylock.nix
      ../../user/wm/hyprland/wofi.nix
      ../../user/wm/hyprland/bluetooth.nix
      ../../user/shell/zsh.nix
      ../../user/shell/starship.nix
      ../../user/terminal/kitty.nix
      ../../user/terminal/tmux.nix
      ../../user/ide/nixvim/base.nix
      ../../user/ide/nixvim/plugins.nix
      ../../user/ide/nixvim/colorscheme.nix
      ../../user/ide/nixvim/keymaps.nix
    ];

  # The state version is required and should stay at the version you
  # originally installed.
  home.stateVersion = "23.11";

  home.packages = with pkgs;
    [
      zsh
      wofi
      sxiv
      kitty
      waybar
      zathura
      wlogout
      firefox
      neofetch
      obsidian
      hyprpaper
      spotifywm
      xfce.thunar
      swaylock-effects
    ];
  
  home.sessionVariables = {
    EDITOR = userSettings.editor;
  };
}

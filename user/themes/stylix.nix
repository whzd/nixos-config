{ config, lib, pkgs, userSettings, ... }:

{
  stylix.autoEnable = false;
  stylix.polarity = "dark";
  stylix.image = ./${userSettings.theme}/bg.jpg;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/${userSettings.theme}.yaml";

  stylix.fonts = {
    monospace = {
      name = userSettings.font;
      package = userSettings.fontPkg;
    };
    serif = {
      name = userSettings.font;
      package = userSettings.fontPkg;
    };
    sansSerif = {
      name = userSettings.font;
      package = userSettings.fontPkg;
    };
    emoji = {
      name = "Noto Color Emoji";
      package = pkgs.noto-fonts-emoji-blob-bin;
    };
    sizes = {
      terminal = 18;
      applications = 12;
      popups = 12;
      desktop = 12;
    };
  };

  stylix.opacity.applications = 0.9;
  stylix.opacity.desktop = 0.9;
  stylix.opacity.popups = 0.9;

  #stylix.targets.waybar.enable = true;
  #stylix.targets.waybar.enableCenterBackColors = true;
  #stylix.targets.waybar.enableLeftBackColors = true;
  #stylix.targets.waybar.enableRightBackColors = true;

  stylix.targets.firefox.enable = true;
  stylix.targets.gtk.enable = true;
  stylix.targets.rofi.enable = true;
  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = ''+config.stylix.image+''

    wallpaper = eDP-1,''+config.stylix.image+''

    wallpaper = HDMI-A-1,''+config.stylix.image+''

    splash = false

  '';
  home.packages = with pkgs; [
     qt5ct
     libsForQt5.breeze-qt5
  ];
  home.sessionVariables = {
    QT_QPA_PLATFORMTHEME="qt5ct";
  };
  programs.zsh.sessionVariables = {
    QT_QPA_PLATFORMTHEME="qt5ct";
  };
  programs.bash.sessionVariables = {
    QT_QPA_PLATFORMTHEME="qt5ct";
  };
  qt = {
    enable = true;
    style.package = pkgs.libsForQt5.breeze-qt5;
    style.name = "breeze-dark";
  };
}

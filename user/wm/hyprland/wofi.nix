{ config, userSettings,... }:

{
  programs.wofi =
  {
    enable = true;
    style =
    ''
      window {
        border-radius: 8px;
        font-family: Font Awesome, ''+userSettings.font+'', Roboto;
        color: #''+config.lib.stylix.colors.base05+'';
      }
      #outer-box {
        border-radius: 7px;
        border: 1px solid #''+config.lib.stylix.colors.base0D+'';
      }
      #input {
        border: 1px solid #''+config.lib.stylix.colors.base0D+'';
      }
      #entry {
        border: 1px solid #''+config.lib.stylix.colors.base01+'';
      }
    '';
  };
}

{ pkgs, ... }:

{
  home.packages = with pkgs;
  [
    wofi
  ];

  programs.wofi =
  {
    enable = true;
    style =
    ''
      window {
        border-radius: 8px;
        font-family: Font Awesome, nerdfonts, Roboto;
        color: #d3c6aa;
      }
      #outer-box {
        border-radius: 7px;
        border: 1px solid #a7c080;
      }
      #input {
        border: 1px solid #a7c080;
      }
      #entry {
        border: 1px solid #374247;
      }
    '';
  };
}

{ pkgs, ... }:

{
  home.packages = with pkgs;
  [
    swaylock-effects
    swaylock-fancy
  ];

  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-fancy;
    settings = {
      color = "#d3c6aa";
      inside-color = "#4a555bcc";
      inside-caps-lock-color = "#d699b6";
      inside-clear-color = "#dbbc7f";
      inside-wrong-color = "#7fbbb3";
      inside-ver-color = "#a7c080";
      line-color = "#2f383e";
      line-caps-lock-color = "#2f383e";
      line-clear-color = "#2f383e";
      line-wrong-color = "#2f383e";
      line-ver-color = "#2f383e";
      ring-color = "#2f383e";
      ring-caps-lock-color = "#d699b6";
      ring-clear-color = "#dbbc7f";
      ring-wrong-color = "#7fbbb3";
      ring-ver-color = "#a7c080";
      text-color = "#d3c6aa";
      key-hl-color = "#83c092";
      font = "nerdfonts";
      font-size = 20;
      fade-in = 0.5;
      grace = 5;
      indicator-radius = 100;
      screenshots = true;
      clock = true;
      timestr="%T";
      datestr="%F";
      effect-blur = "10x10";
      ignore-empty-password = true;
    };
  };
}

{ pkgs, ... }:

{
  environment.systemPackages = with pkgs;
    [
      wayland
    ];

  services.xserver =
    {
      enable = true;
      xkb =
        {
          layout = "us";
          variant = "intl";
          options = "ctrl:swapcaps";
        };
    };
}

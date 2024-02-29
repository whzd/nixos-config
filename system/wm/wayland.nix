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
      displayManager.sddm =
        {
	  enable = true;
	  wayland.enable = true;
	  #enableHidpi = true;
	  #theme = "chili";
	};
    };
}

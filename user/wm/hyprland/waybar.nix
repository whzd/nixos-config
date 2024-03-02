{ pkgs, userSettings, config, lib, ... }:

{
  home.packages = with pkgs;
  [
    pyprland
  ];
  home.file.".config/hypr/pyprland.json".text =
  ''
    {
      "pyprland": {
        "plugins": ["scratchpads"]
      },
      "scratchpads": {
        "pavucontrol": {
          "command": "pavucontrol",
          "margin": 50,
          "unfocus": "hide",
          "animation": "fromTop"
        }
      }
    }
  '';
  programs.waybar =
  {
    enable = true;
    settings =
    {
      mainBar =
      {
        layer = "top";
        position = "top";
	#output = if (nrMonitors == 2) then "HDMI-A-1" else "eDP-1";
        height = 35;
        margin = "7 7 3 7";
        spacing = 2;
        modules-left =
	[ "hyprland/workspaces" ];
        modules-center =
	[ "hyprland/window" ];
        modules-right =
	[
	  "network"
	  "pulseaudio"
	  "bluetooth"
	  "battery"
	  "clock"
	];
        "hyprland/workspaces" = {
	  #"all-outputs" = true;
	  #"active-only" = true;
	  "format" = "{icon}";
          "format-icons" =
	  {
            "1" = "1 ";
            "2" = "2 󰖟";
            "3" = "3 ";
            "4" = "4 ";
            "5" = "5 ";
            "6" = "6 ";
            "7" = "7 ";
            "8" = "8 ";
            "9" = "9 ";
	    "10" = "0 ";
	  };
        };
        "hyprland/window" = {
            "max-length" = 25;
	    "separate-outputs" = true;
        };
        clock = {
            "format-alt" = "{:%a, %d. %b  %H:%M}";
        };
        battery =
	{
	    "states" =
	    {
              "good" = 95;
              "warning" = 30;
              "critical" = 15;
            };
            "format" = "{capacity}% {icon}";
	    "format-alt"= "{icon} {time}";
	    #"format-discharging"= " {capacity}%";
	    "format-charging"= " {capacity}%";
	    "format-plugged" = "{capacity}% ";
            "format-icons" =
	    [
	      ""
	      ""
	      ""
	      ""
	      ""
	    ];
        };
	network = {
          "format" = "{ifname}";
          "format-wifi" = "  {essid}";
          "format-ethernet" = "  {ifname}";
          "format-disconnected" = "";
          "tooltip-format-wifi" = "{signalStrength}%";
          "max-length" = 20;
        };
	bluetooth =
	{
          "interval" = 30;
          "format" = "{icon}";
          "format-alt" = "{status}";
          "format-icons" = {
              "enabled" = "";
              "disabled" = "";
	  };
	};
	pulseaudio = {
          "scroll-step" = 1;
          "format" = "{volume}% {icon} {format_source}";
          "format-bluetooth" = "{volume}% {icon}  {format_source}";
          "format-bluetooth-muted" = "󰸈 {icon}  {format_source}";
          "format-muted" = "󰸈 {format_source}";
          "format-source" = "";
          "format-source-muted" = "";
          "format-icons" = {
            "headphone" = "";
            "hands-free" = "";
            "headset" = "";
            "phone" = "";
            "portable" = "";
            "default" = [ "" "" "" ];
          };
          "on-click" = "pypr toggle pavucontrol && hyprctl dispatch bringactivetotop";
        };
      };
    };
  };
}

{ pkgs, userSettings, config, lib, ... }:

{
  home.packages = with pkgs;
  [
    pyprland
    networkmanagerapplet
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
        spacing = 10;
        modules-left =
	[
	  "battery"
	  "pulseaudio"
	  #"weather"
	];
        modules-center =
	[ "hyprland/workspaces" ];
        modules-right =
	[
	  "bluetooth"
	  "network"
	  "clock"
	  "custom/power"
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
        clock = {
          "format" = "{:%a, %d %b, %H:%M}";
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
          "format-wifi" = "  ({signalStrength}%)";
          "format-ethernet" = "  ";
	  "format-disconnected" = " ";
	  "tooltip-format" = "{essid}: {ipaddr}/{cidr}";
          "on-click" = "nm-connection-editor";
        };
	bluetooth = {
        "format" = "󰂯";
        "format-disabled" = "󰂲";
        "on-click" = "blueman-manager";
        "on-click-right" = "rfkill toggle bluetooth";
        "tooltip-format" = "{}";
        };
	pulseaudio = {
          "scroll-step" = 1;
          "format" = "{volume}% {icon}{format_source}";
          "format-bluetooth" = "{volume}% {icon} {format_source}";
          "format-bluetooth-muted" = "󰸈 {icon} {format_source}";
          "format-muted" = "󰸈 {format_source}";
          "format-source" = "";
          "format-source-muted" = " ";
          "format-icons" = {
            "headphone" = " ";
            "hands-free" = " ";
            "headset" = " ";
            "phone" = " ";
            "portable" = " ";
            "default" = 
	    [
	      ""
	      ""
	      ""
	    ];
          };
          "on-click" = "pypr toggle pavucontrol && hyprctl dispatch bringactivetotop";
        };
	"custom/power" = {
          "format-icon" = " ";
          "on-click" = "";
        };
      };
    };
    style =
    ''
    * {
        border: none;
        font-family: Font Awesome, ''+userSettings.font+'', Roboto, Arial, sans-serif;
        font-size: 14px;
        color: #'' + config.lib.stylix.colors.base05 + '';
        border-radius: 5px;
    }
    
    window {
    	/*font-weight: bold;*/
    }
    window#waybar {
        background: rgba(0, 0, 0, 0);
    }
    /*-----module groups----*/
    .modules-right {
    	background-color: #'' + config.lib.stylix.colors.base00 + '';
        margin: 2px 10px 0 0;
    }
    .modules-center {
    	background-color: #'' + config.lib.stylix.colors.base00 + '';
        margin: 2px 0 0 0;
    }
    .modules-left {
    	background-color: #'' + config.lib.stylix.colors.base00 + '';
        margin: 2px 0 0 5px;
    }
    /*-----modules indv----*/
    #workspaces button {
        padding: 3px 6px;
        background-color: transparent;
    }
    #workspaces button:hover {
        box-shadow: inherit;
    	background-color: #'' + config.lib.stylix.colors.base0D + '';
    }
    #workspaces button.focused {
    	background-color: #'' + config.lib.stylix.colors.base04 + '';
    }
    #workspaces button.active {
    	background-color: #'' + config.lib.stylix.colors.base02 + '';
    }
    
    #clock,
    #battery,
    #cpu,
    #memory,
    #temperature,
    #network,
    #pulseaudio,
    #custom-media,
    #tray,
    #mode,
    #custom-power,
    #custom-menu,
    #bluetooth {
        padding: 0 10px;
    }
    #mode {
        color: #cc3436;
        font-weight: bold;
    }
    #custom-power {
        background-color: rgba(0,119,179,0.6);
        border-radius: 100px;
        margin: 5px 5px;
        padding: 1px 1px 1px 6px;
    }
    /*-----Indicators----*/
    #idle_inhibitor.activated {
        color: #2dcc36;
    }
    #pulseaudio.muted {
        font-size: 16px;
        color: #cc3436;
    }
    #battery.charging {
        color: #2dcc36;
    }
    #battery.warning:not(.charging) {
    	color: #e6e600;
    }
    #battery.critical:not(.charging) {
        color: #cc3436;
    }
    #temperature.critical {
        color: #cc3436;
    }
    '';
  };
}

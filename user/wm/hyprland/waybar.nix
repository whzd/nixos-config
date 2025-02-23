{ pkgs, ... }:

{
  home.packages = with pkgs;
  [
    networkmanagerapplet
    overskride
    iwgtk
    waybar
  ];
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
          "hyprland/workspaces" 
	  #"weather"
	];
        #modules-center = [];
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

	"custom/power" = {
          "format" = " {}";
	  "tooltip" = false;
          "on-click" = "pkill wlogout || wlogout";
        };
        clock = {
          "format" = "{:%a, %d %b %Y, %H:%M}";
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
          "on-click" = "iwgtk";
        };
	bluetooth = {
        "format" = "󰂯";
        "format-disabled" = "󰂲";
        "on-click" = "overskride";
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
          "on-click" = "pavucontrol";
        };
      };
    };
    style =
    ''
    * {
        border: none;
        font-family: Font Awesome, nerdfonts, Roboto, Arial, sans-serif;
        font-size: 14px;
        color: #d3c6aa;
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
    	background-color: #2f383e;
        margin: 2px 10px 0 0;
    }
    /*
    .modules-center {
    	background-color: #2f383e;
        margin: 2px 0 0 0;
    }
    */
    .modules-left {
    	background-color: #2f383e;
        margin: 2px 0 0 5px;
    }
    /*-----modules indv----*/
    #workspaces button {
        /*background-color: transparent;*/
    	background-color: #4a555b;
	border-radius: 0px;
    }
    #workspaces button:hover {
        box-shadow: inherit;
    	background-color: #a7c080;
    }
    #workspaces button.focused {
    	background-color: #9da9a0;
    }
    #workspaces button.active {
    	background-color: #9da9a0;
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

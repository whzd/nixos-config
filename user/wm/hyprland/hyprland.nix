{ config, lib, pkgs, stylix, ... }:

{
  home.packages = with pkgs;
  [
    cliphist
    wofi
    grim
    slurp
    polkit-kde-agent
  ];

  gtk.cursorTheme = {
    package = pkgs.quintom-cursor-theme;
    name = "Quintom_Ink";
    size = 25;
  };

  wayland.windowManager.hyprland =
    {
      enable = true;
      plugins = [];
      settings = 
        { 
	  # Main mod
          "$mainMod" = "ALT";

	  # Keyboard bindings
	  bind =
	  [
	    # Custom shortcuts
	    "$mainMod, RETURN, exec, kitty"
	    "$mainMod SHIFT, Q, killactive" 
	    "SHIFT CTRL, L, exec, swaylock"
	    "$mainMod SHIFT, E, exec, pkill wlogout || wlogout"
	    "$mainMod, F, fullscreen"
	    "$mainMod SHIFT, F, togglefloating"
	    "$mainMod, O, togglesplit"
	    "$mainMod, P, exec, pkill wofi || wofi --show drun"
	    "$mainMod, V, exec, cliphist list | wofi --dmenu | cliphist decode | wl-copy"
	    ", Print, exec, grim -g \"$(slurp -d)\" - | wl-copy"

	    # Switch workspaces with mainMod + [0-9]
	    "$mainMod, 1, workspace, 1"
	    "$mainMod, 2, workspace, 2"
	    "$mainMod, 3, workspace, 3"
	    "$mainMod, 4, workspace, 4"
	    "$mainMod, 5, workspace, 5"
	    "$mainMod, 6, workspace, 6"
	    "$mainMod, 7, workspace, 7"
	    "$mainMod, 8, workspace, 8"
	    "$mainMod, 9, workspace, 9"
	    "$mainMod, 0, workspace, 10"
	    
	    # Move focus with mainMod + vim movement
	    "$mainMod, H, movefocus, l"
	    "$mainMod, L, movefocus, r"
	    "$mainMod, K, movefocus, u"
	    "$mainMod, J, movefocus, d"

	    # Move window with mainMod + shift + vim movement
	    "$mainMod SHIFT, H, movewindow, l"
	    "$mainMod SHIFT, L, movewindow, r"
	    "$mainMod SHIFT, K, movewindow, u"
	    "$mainMod SHIFT, J, movewindow, d"
	    
	    
	    # Move active window to a workspace with mainMod + SHIFT + [0-9]
	    "$mainMod SHIFT, 1, movetoworkspace, 1"
	    "$mainMod SHIFT, 2, movetoworkspace, 2"
	    "$mainMod SHIFT, 3, movetoworkspace, 3"
	    "$mainMod SHIFT, 4, movetoworkspace, 4"
	    "$mainMod SHIFT, 5, movetoworkspace, 5"
	    "$mainMod SHIFT, 6, movetoworkspace, 6"
	    "$mainMod SHIFT, 7, movetoworkspace, 7"
	    "$mainMod SHIFT, 8, movetoworkspace, 8"
	    "$mainMod SHIFT, 9, movetoworkspace, 9"
	    "$mainMod SHIFT, 0, movetoworkspace, 10"

	    # Switch workspaces
	    "$mainMod SHIFT CTRL, 1, movecurrentworkspacetomonitor, desc:Dell Inc. DELL P2419H 2NGBFZ2"
	    "$mainMod SHIFT CTRL, 2, movecurrentworkspacetomonitor, eDP-1"
	    "$mainMod SHIFT CTRL, 3, movecurrentworkspacetomonitor, HDMI-A-1"
	    "$mainMod SHIFT CTRL, 4, movecurrentworkspacetomonitor, DP-1"

	  ];

	  # Workspace Rules
	  workspace =
	  [
	    ## Office
	    "1, desc:Dell Inc. DELL P2419H 2NGBFZ2, default:true"
	    "2, desc:Dell Inc. DELL P2419H 2NGBFZ2, on-created-empty:firefox"
	    "3, desc:Dell Inc. DELL P2419H 2NGBFZ2, on-created-empty:obsidian -enable-features=UseOzonePlatform -ozone-platform=wayland"
	    "4, desc:Dell Inc. DELL P2419H 2NGBFZ2"
	    "5, desc:Dell Inc. DELL P2419H 2NGBFZ2"
	    "6, desc:Dell Inc. DELL P2419H 2NGBFZ2"
	    "7, desc:Dell Inc. DELL P2419H 2NGBFZ2"
	    ## Laptop
	    "8, monitor:eDP-1, on-created-empty:teams-for-linux -enable-features=UseOzonePlatform -ozone-platform=wayland, default:true"
	    "9, monitor:eDP-1, on-created-empty:spotify -enable-features=UseOzonePlatform -ozone-platform=wayland"
	    "10, monitor:eDP-1"
	  ];

	  misc =
	    {
	      "disable_splash_rendering" = true;
              "force_default_wallpaper" = 0; # Set to 0 to disable the anime mascot wallpapers
	    };
	};
      extraConfig =
        ''
	  exec-once = dbus-update-activation-environment DISPLAY XAUTHORITY WAYLAND_DISPLAY
	  exec-once = hyprpaper
	  exec-once = nm-applet
    exec-once = blueman-applet
    exec-once = waybar
	  exec-once = hyprctl setcursor Quintom_Ink 25
	  exec-once = wl-paste --type text --watch cliphist store #Stores only text data
	  exec-once=/usr/lib/polkit-kde-authentication-agent-1


          # Monitors
	  # Default
          monitor=,preferred,auto,1

	  # Only laptop
	  monitor=eDP-1, 1920x1200@60, 0x0, 1.25

	  # Two monitors Home
	  monitor=HDMI-A-1, 1920x1080@60, 0x0, 1
	  monitor=eDP-1, 1920x1200@60, 0x1080, 1.25

	  # Two monitors Office
	  monitor=desc:Dell Inc. DELL P2419H 2NGBFZ2, 1920x1080@60, 0x0, 1
	  monitor=eDP-1, 1920x1200@60, 0x1080, 1.25

          #env = XCURSOR_SIZE,24
          
          # For all categories, see https://wiki.hyprland.org/Configuring/Variables/
          input {
              kb_layout = us
              kb_variant = intl
              kb_model =
              kb_options = ctrl:swapcaps
              kb_rules =
          
              follow_mouse = 1
          
              touchpad {
                  natural_scroll = no
              }
          
              sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
          }
          
	  general {
            border_size = 4
            col.active_border = rgb(a7c080)

	    col.inactive_border = 0x33'' + config.lib.stylix.colors.base00 + ''

                resize_on_border = true
                gaps_in = 7
                gaps_out = 7
           }
          
          decoration {
              # See https://wiki.hyprland.org/Configuring/Variables/ for more
          
              rounding = 10
              
              blur {
                  enabled = true
                  size = 3
                  passes = 1
              }
              shadow {
                enabled = yes
                range = 4
                render_power = 3
              }
          
          }
          cursor {
            inactive_timeout = 30
            no_warps = false
          }
          
          animations {
              enabled = yes
          
              # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
          
              bezier = myBezier, 0.05, 0.9, 0.1, 1.05
          
              animation = windows, 1, 7, myBezier
              animation = windowsOut, 1, 7, default, popin 80%
              animation = border, 1, 10, default
              animation = borderangle, 1, 8, default
              animation = fade, 1, 7, default
              animation = workspaces, 1, 6, default
          }
          
          dwindle {
              # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
              pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
              preserve_split = yes # you probably want this
          }
          
            #col.inactive_border = rgb('' + config.lib.stylix.colors.base00 + '')
          master {
              # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
              new_status = master
          }
          
          gestures {
              # See https://wiki.hyprland.org/Configuring/Variables/ for more
              workspace_swipe = off
          }
          
          # Example per-device config
          # See https://wiki.hyprland.org/Configuring/Keywords/#executing for more
          device {
              name = epic-mouse-v1
              sensitivity = -0.5
          }
          
          # Example windowrule v1
          # windowrule = float, ^(kitty)$
          # Example windowrule v2
          # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
          # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
	  
          # Move/resize windows with mainMod + LMB/RMB and dragging
          bindm = $mainMod SHIFT, mouse:272, movewindow
          bindm = $mainMod SHIFT, mouse:273, resizewindow
          
          # Example special workspace (scratchpad)
          bind = $mainMod, S, togglespecialworkspace, magic
          bind = $mainMod SHIFT, S, movetoworkspace, special:magic

	  # Keyboard media butons
	  bindel=, XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
          bindel=, XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
          bindl=, XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle

	  # Lid close and open events
	  #bindl=,switch:off:Lid Switch,exec,hyprctl keyword monitor "eDP-1, disable"
	  #bindl=,switch:on:Lid Switch,exec,hyprctl keyword monitor "eDP-1, 1920x1200@60, 0x1080, 1.25"

	  # Power button
	  bind =,XF86PowerOff, exec, pkill wlogout || wlogout
          
	  # Pulsadio float window
          $pavucontrol = class:^(pavucontrol)$
          windowrulev2 = opacity 0.8,$pavucontrol

	  # Kitty window
	  windowrulev2 = opacity 0.9 0.9,class:^(kitty)$

	  # Bluetooth window
	  $overskride = class:^(io.github.kaii_lb.Overskride)$
          windowrulev2 = opacity 0.8,$overskride

	  # Wifi window
	  $iwgtk = class:^(iwgtk)
          windowrulev2 = opacity 0.8,$iwgtk
	  # Wifi window
	  $iwgtk2 = class:^(org.twosheds.iwgtk)
          windowrulev2 = opacity 0.8,$iwgtk2

	  # Obsidian window
	  $obsidian = class:^(obsidian)$
	  windowrulev2 = opacity 0.95,$obsidian

	  #

	'';
    };
}

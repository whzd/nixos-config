{ config, lib, pkgs, stylix, ... }:

{
  gtk.cursorTheme = {
    package = pkgs.quintom-cursor-theme;
    name = if (config.stylix.polarity == "light") then "Quintom_Ink" else "Quintom_Snow";
    size = 36;
  };

  wayland.windowManager.hyprland =
    {
      enable = true;
      plugins = [];
      settings = 
        { 
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
	  exec-once = pypr
	  exec-once = hyprctl setcursor '' + config.gtk.cursorTheme.name + " " + builtins.toString config.gtk.cursorTheme.size + ''

          # Monitors
	  # Default
          monitor=,preferred,auto,1

	  # Only laptop
	  monitor=eDP-1, 1920x1200@60, 0x0, 1.25

	  # Two monitors
	  monitor=HDMI-A-1, 1920x1080@60, 0x0, 1
	  monitor=eDP-1, 1920x1200@60, 0x1080, 1.25

          env = XCURSOR_SIZE,24
          
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
            cursor_inactive_timeout = 30
            border_size = 4
            no_cursor_warps = false
            col.active_border = rgb('' + config.lib.stylix.colors.base0D + '')

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
          
              drop_shadow = yes
              shadow_range = 4
              shadow_render_power = 3
              #col.shadow = rgba(1a1a1aee)
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
              new_is_master = true
          }
          
          gestures {
              # See https://wiki.hyprland.org/Configuring/Variables/ for more
              workspace_swipe = off
          }
          
          # Example per-device config
          # See https://wiki.hyprland.org/Configuring/Keywords/#executing for more
          device:epic-mouse-v1 {
              sensitivity = -0.5
          }
          
          # Example windowrule v1
          # windowrule = float, ^(kitty)$
          # Example windowrule v2
          # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
          # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more

	  windowrulev2 = opacity 0.9 0.9,class:^(kitty)$

          
	  # Main mod
          $mainMod = ALT
          
	  # Custom shortcuts
          bind = $mainMod, RETURN, exec, kitty
          bind = $mainMod SHIFT, Q, killactive, 
          bind = $mainMod, M, exit, 
          bind = $mainMod, F, togglefloating, 
          bind = $mainMod, O, togglesplit, # dwindle
          bind = $mainMod, P, exec, wofi --show drun
          
          # Move focus with mainMod + vim movement
          bind = $mainMod, H, movefocus, l
          bind = $mainMod, L, movefocus, r
          bind = $mainMod, K, movefocus, u
          bind = $mainMod, J, movefocus, d

          # Move window with mainMod + shift + vim movement
          bind = $mainMod SHIFT, H, movewindow, l
          bind = $mainMod SHIFT, L, movewindow, r
          bind = $mainMod SHIFT, K, movewindow, u
          bind = $mainMod SHIFT, J, movewindow, d
          
          # Switch workspaces with mainMod + [0-9]
          bind = $mainMod, 1, workspace, 1
          bind = $mainMod, 2, workspace, 2
          bind = $mainMod, 3, workspace, 3
          bind = $mainMod, 4, workspace, 4
          bind = $mainMod, 5, workspace, 5
          bind = $mainMod, 6, workspace, 6
          bind = $mainMod, 7, workspace, 7
          bind = $mainMod, 8, workspace, 8
          bind = $mainMod, 9, workspace, 9
          bind = $mainMod, 0, workspace, 10
          
          # Move active window to a workspace with mainMod + SHIFT + [0-9]
          bind = $mainMod SHIFT, 1, movetoworkspace, 1
          bind = $mainMod SHIFT, 2, movetoworkspace, 2
          bind = $mainMod SHIFT, 3, movetoworkspace, 3
          bind = $mainMod SHIFT, 4, movetoworkspace, 4
          bind = $mainMod SHIFT, 5, movetoworkspace, 5
          bind = $mainMod SHIFT, 6, movetoworkspace, 6
          bind = $mainMod SHIFT, 7, movetoworkspace, 7
          bind = $mainMod SHIFT, 8, movetoworkspace, 8
          bind = $mainMod SHIFT, 9, movetoworkspace, 9
          bind = $mainMod SHIFT, 0, movetoworkspace, 10
          
          # Example special workspace (scratchpad)
          bind = $mainMod, S, togglespecialworkspace, magic
          bind = $mainMod SHIFT, S, movetoworkspace, special:magic

	  # Keyboard media butons
	  bindel=, XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
          bindel=, XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
          bindl=, XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
          
	  # Pulsadio float window
          $pavucontrol = class:^(pavucontrol)$
          windowrulev2 = float,$pavucontrol
          windowrulev2 = size 86% 40%,$pavucontrol
          windowrulev2 = move 50% 6%,$pavucontrol
          windowrulev2 = workspace special silent,$pavucontrol
          windowrulev2 = opacity 0.80,$pavucontrol

	  # Workspace Rules
	  workspace = 1, monitor:HDMI-A-1, default:true
	  workspace = 2, monitor:HDMI-A-1, on-created-empty:firefox
	  workspace = 3, monitor:HDMI-A-1, on-created-empty:obsidian -enable-features=UseOzonePlatform -ozone-platform=wayland
	  workspace = 4, monitor:HDMI-A-1
	  workspace = 5, monitor:HDMI-A-1
	  workspace = 6, monitor:HDMI-A-1
	  workspace = 7, monitor:HDMI-A-1
	  workspace = 8, monitor:eDP-1
	  workspace = 9, monitor:eDP-1, on-created-empty:spotify -enable-features=UseOzonePlatform -ozone-platform=wayland
	  workspace = 10, monitor:eDP-1

	'';
    };
}

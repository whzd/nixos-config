{ pkgs,  ... }:

{
  home.packages = with pkgs;
  [
    tmux
    zsh
  ];
  programs.tmux =
  {
    enable = true;
    extraConfig =
    ''
      # Free the default prefix keybinding
      unbind C-b

      # Bind prefix to <C-a> on all sessions
      set -g prefix C-a

      # Ensure that we can use <C-a> on other apps (by pressing it twice)
      bind C-a send-prefix

      # Set defualt shell to zsh
      set -g default-shell ${pkgs.zsh}/bin/zsh

      # Change default delay to 1 ms
      set -sg escape-time 1

      # Set index of windows to start at 1
      set -g base-index 1

      # Set index of panes to start at 1
      setw -g pane-base-index 1

      # Split pane and retain the current directory
      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"

      # Splitting panes
      bind \\ split-window -h
      bind _ split-window -v

      # Open new window and retain  the current directory
      bind c new-window -c "#{pane_current_path}"

      # Open new window
      bind C-c new-window

      # Vim-like pane switching
      bind ^ last-window
      bind k select-pane -U
      bind j select-pane -D
      bind h select-pane -L
      bind l select-pane -R

      # Vim-like window switching
      bind -r C-h select-window -t :-
      bind -r C-l select-window -t :+

      # Vim-like session switching
      unbind p
      unbind n
      bind -r p switch-client -p
      bind -r n switch-client -n

      # Vim-like resize panes
      bind -r K resize-pane -U 5
      bind -r J resize-pane -D 5
      bind -r H resize-pane -L 5
      bind -r L resize-pane -R 5

      # Disable mouse support
      set -g mouse on
      #set -g mouse off

      # Set the default terminal mode to 256color mode
      set -g default-terminal "screen-256color"

      # Set the status line's colors
      #setw -g status-style 'bg=#333335 fg=#5eacd3'
      setw -g status-style 'bg=#4a555b fg=#d3c6aa'

      # Set colors for the active window
      setw -g window-status-current-style 'fg=#e4e1cd,bold'

      # Set colors for pane borders
      setw -g pane-border-style 'bg=#4a555b fg=#d3c6aa'
      setw -g pane-active-border-style 'bg=#4a555b fg=#d3c6aa'

      # Set active pane normal, other shaded out
      #setw -g window-style 'bg=color0'
      #setw -g window-active-style 'bg=terminal'

      # Set command / message line colors
      set -g message-style 'bg=#2f383e fg=#FFFFFF,bold'

      # Remove right side status text
      set -g status-right ""

      # Center the window list
      set -g status-justify centre

      # Enable activity alerts
      setw -g monitor-activity on
      set -g visual-activity on

      # Enable vi keys
      setw -g mode-keys vi

      # Add vim copy past binds
      bind -T copy-mode-vi Escape send -X cancel
      bind -T copy-mode-vi 'v' send -X begin-selection
      bind -T copy-mode-vi 'V' send -X rectangle-toggle
      #bind -T copy-mode-vi 'y' send -X copy-pipe-and-cancel "xclip -sel clip -i"

      # Allow paste clipboard to tmux
      #bind C-v run "tmux set-buffer \"$(xclip -o -sel clipboard)\"; tmux paste-buffer"

      # Shorcut for synchronize-panes toggle
      bind C-s set-window-option synchronize-panes \; display "Toggled synchronize-panes"

      #Log output to a text file on demand
      bind P pipe-pane -o "cat >>~/#S_#W_#P.log" \; display "Toggled logging to ~/#S_#W_#P.log"
    '';
  };
}

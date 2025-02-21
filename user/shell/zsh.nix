{ ... }:

{
  programs.zsh =
    {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    history.size = 10000;
    initExtra =
      ''
      	# Remove anoying beep
        unsetopt beep

	# Bind autosuggestions complete
	bindkey '^ ' autosuggest-accept

	# Initiate tmux session on open
	if [[ "$TERM" != "screen-256color" ]]
	then
	  tmux attach-session -t "$USER" || tmux new-session -s "$USER"
	fi
      '';

    oh-my-zsh =
      {
	enable = true;
	plugins =
	[ 
	  "git"
	];
	theme = "robbyrussell";
      };
    };
}

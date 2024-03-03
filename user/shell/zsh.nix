{ ... }:

{
  programs.zsh =
    {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    history.size = 10000;
    initExtra =
      ''
      	# Remove anoying beep
        unsetopt beep
	# Bind autosuggestions complete
	bindkey '^ ' autosuggest-accept
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

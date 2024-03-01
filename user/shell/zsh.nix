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
        unsetopt beep
      '';

    oh-my-zsh =
      {
	enable = true;
	plugins = [ "git" ];
	theme = "robbyrussell";
      };
    };
}

{ ... }:

{

  programs.nixvim =
  {
    
    plugins.lsp =
    {
      enable = true;
      keymaps =
      {
        diagnostic = 
        {
          "]d" = "goto_next";
          "[d" = "goto_prev";
        };
        lspBuf =
        {
          K = "hover";
          gr = "references";
          gd = "definition";
          gi = "implementation";
          gt = "type_definition";
        };
      };
      servers =
      {
        nixd.enable = true;
        ansiblels.enable = true;
        gopls.enable = true;
        pyright.enable = true;
        jsonls.enable = true;
        marksman.enable = true;
        terraformls.enable = true;
      };
    };
  };
}

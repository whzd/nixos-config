{ 
  helpers,
  pkgs,
  ...
}:

{
  imports =
  [
    ./colorscheme.nix
    ./keymaps.nix
    ./plugins
  ];

  home.packages = with pkgs;
  [
    wl-clipboard
  ];
  
  programs.nixvim =
  {
    enable = true;
    viAlias = true;
    vimAlias = true;

    options =
    {
      autowrite = true;
      clipboard = "unnamedplus";
      completeopt = "menu,menuone,noselect";
      conceallevel = 2;
      confirm = true;
      cursorline = true;
      expandtab = true;
      formatoptions = "jcroqlnt";
      grepformat = "%f:%l:%c:%m";
      grepprg = "rg --vimgrep";
      ignorecase = true;
      inccommand = "nosplit";
      laststatus = 3;
      list = true;
      mouse = "a";
      number = true;
      pumblend = 10;
      pumheight = 10;
      relativenumber = true;
      scrolloff = 4;
      sessionoptions =
      [
        "buffers"
        "curdir"
        "tabpages"
        "winsize"
        "help"
        "globals"
        "skiprtp"
        "folds"
      ];
      shiftround = true;
      shiftwidth = 2;
      showmode = false;
      sidescrolloff = 8;
      signcolumn = "yes";
      smartcase = true;
      smartindent = true;
      spelllang = [ "en" ];
      splitbelow = true;
      splitkeep = "screen";
      splitright = true;
      tabstop = 2;
      termguicolors = true;
      timeoutlen = 1000;
      undofile = true;
      undolevels = 10000;
      updatetime = 200;
      virtualedit = "block";
      wildmode = "longest:full,full";
      winminwidth = 5;
      wrap = true;
      fillchars =
      {
        foldopen = "";
        foldclose = "";
        fold = "⸱";
        foldsep = " ";
        diff = "╱";
        eob = " ";
      };
    };

    clipboard.register = "unnamedplus";
    clipboard.providers =
    {
      wl-copy.enable = true;
      wl-copy.package = pkgs.wl-clipboard;
    };
  };
}

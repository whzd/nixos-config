{ ... }:

{
  programs.nixvim =
  {
    # Set leader to space
    globals.mapleader = " ";

    keymaps =
    [
      # Quit
      {
        mode = "n";
        key = "<leader>qq";
        action = "<cmd>qa<cr>";
        options =
        {
          desc = "Quit all";
        };
      }
      # Move to window using the <ctrl> hjkl keys
      {
        mode = "n";
        key = "<C-h>";
        action = "<C-w>h";
        options =
        {
          desc = "Go to left window";
          remap = true;
        };
      }
      {
        mode = "n";
        key = "<C-j>";
        action = "<C-w>j";
        options =
        {
          desc = "Go to lower window";
          remap = true;
        };
      }
      {
        mode = "n";
        key = "<C-k>";
        action = "<C-w>k";
        options =
        {
          desc = "Go to upper window";
          remap = true;
        };
      }
      {
        mode = "n";
        key = "<C-l>";
        action = "<C-w>l";
        options =
        {
          desc = "Go to right window";
          remap = true;
        };
      }
      # better up/down
      {
        mode =
        [
          "n"
          "x"
        ];
        key = "j";
        action = "v:count == 0 ? 'gj' : 'j'";
        options =
        {
          expr = true;
          silent = true;
        };
      }
      {
        mode =
        [
          "n"
          "x"
        ];
        key = "<Down>";
        action = "v:count == 0 ? 'gj' : 'j'";
        options =
        {
          expr = true;
          silent = true;
        };
      }
      {
        mode =
        [
          "n"
          "x"
        ];
        key = "k";
        action = "v:count == 0 ? 'gk' : 'k'";
        options =
        {
          expr = true;
          silent = true;
        };
      }
      {
        mode =
        [
          "n"
          "x"
        ];
        key = "<Up>";
        action = "v:count == 0 ? 'gk' : 'k'";
        options =
        {
          expr = true;
          silent = true;
        };
      }
      # Resize window using <ctrl> arrow keys
      {
        mode = "n";
        key = "<C-Up>";
        action = "<cmd>resize +2<cr>";
        options =
        {
          desc = "Increase window height";
        };
      }
      {
        mode = "n";
        key = "<C-Down>";
        action = "<cmd>resize -2<cr>";
        options =
        {
          desc = "Decrease window height";
        };
      }
      {
        mode = "n";
        key = "<C-Left>";
        action = "<cmd>vertical resize -2<cr>";
        options =
        {
          desc = "Decrease window width";
        };
      }
      { 
        mode = "n";
        key = "<C-Right>";
        action = "<cmd>vertical resize +2<cr>";
        options =
        {
          desc = "Increase window width";
        };
      }
      # Move Lines
      {
        mode = "v";
        key = "<C-j>";
        action = ":m '>+1<cr>gv=gv";
        options =
        {
          desc = "Move down";
        };
      }
      {
        mode = "v";
        key = "<C-k>";
        action = ":m '<-2<cr>gv=gv";
        options = 
        {
          desc = "Move up";
        };
      }
      # Clear search with <esc>
      {
        mode =
        [
          "i"
          "n"
        ];
        key = "<esc>";
        action = "<cmd>noh<cr><esc>";
        options =
        {
          desc = "Escape and clear hlsearch";
        };
      }
      # Clear search, diff update and redraw
      {
        mode = "n";
        key = "<leader>ur";
        action = "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>";
        options =
        {
          desc = "Redraw / clear hlsearch / diff update";
        };
      }
      # Save file
      {
        mode =
        [
          "i"
          "x"
          "n"
          "s"
        ];
        key = "<C-s>";
        action = "<cmd>w<cr><esc>";
        options =
        {
          desc = "Save file";
        };
      }
    ];
  };
}

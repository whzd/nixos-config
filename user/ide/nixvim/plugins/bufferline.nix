{ ... }:

{
  programs.nixvim =
  {
    plugins.bufferline =
    {
      enable = true;
      alwaysShowBufferline = false;
      offsets =
        [
        {
          filetype = "neo-tree";
          text = "Neo-tree";
          highlight = "Directory";
          text_align = "left";
        }
        ];
    };
    keymaps =
      [
      {
        key = "<leader>bp";
        action="<Cmd>BufferLineTogglePin<CR>";
        options.desc = "Toggle pin";
      }
    {
      key = "<leader>bd";
      action = "<Cmd>bp|bd#<CR>";
      options.desc = "Delete current buffer";
    }
    {
      key = "<leader>bP";
      action = "<Cmd>BufferLineGroupClose ungrouped<CR>";
      options.desc = "Delete non-pinned buffers";
    }
    { 
      key = "<leader>bo";
      action = "<Cmd>BufferLineCloseOthers<CR>";
      options.desc = "Delete other buffers";
    }
    {
      key = "<leader>br";
      action = "<Cmd>BufferLineCloseRight<CR>";
      options.desc = "Delete buffers to the right";
    }
    {
      key = "<leader>bl";
      action = "<Cmd>BufferLineCloseLeft<CR>";
      options.desc = "Delete buffers to the left";
    }
    {
      key = "<S-h>";
      action = "<cmd>BufferLineCyclePrev<cr>";
      options.desc = "Prev buffer";
    }
    {
      key = "<S-l>";
      action = "<cmd>BufferLineCycleNext<cr>";
      options.desc = "Next buffer";
    }
    {
      key = "[b";
      action = "<cmd>BufferLineCyclePrev<cr>";
      options.desc = "Prev buffer";
    }
    {
      key = "]b";
      action = "<cmd>BufferLineCycleNext<cr>";
      options.desc = "Next buffer";
    }
    ];
  };
}

{ pkgs, ... }:

{
  programs.nixvim.plugins =
  {
    luasnip =
    {
      enable = true;
      fromVscode =
      [
        {
          paths = "${pkgs.vimPlugins.friendly-snippets}";
        }
      ];
    };

    cmp-buffer.enable = true;
    cmp-emoji.enable = true;
    cmp-nvim-lsp.enable = true;
    cmp-path.enable = true;
    cmp_luasnip.enable = true;

    cmp =
    {
      enable = true;
      autoEnableSources = false;
      settings =
      {
        sources = [
          { name = "nvim_lsp"; }
          { name = "luasnip"; }
          { name = "path"; }
          { name = "buffer"; }
          { name = "nvim_lua"; }
        ];
        mapping =
        {
          __raw = ''
            cmp.mapping.preset.insert({
              ['<C-Space>'] = cmp.mapping.complete(),
              ['<C-e>'] = cmp.mapping.close(),
              ['<C-d>'] = cmp.mapping.scroll_docs(-4),
              ['<C-f>'] = cmp.mapping.scroll_docs(4),
              ['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
              ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'}),
              ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'}),
              ['<Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                  cmp.select_next_item() 
                elseif require("luasnip").expand_or_jumpable() then
                  vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
                else
                  fallback()
                end
              end, { 'i', 's'}),
              ['<S-Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                  cmp.select_prev_item()
                elseif require("luasnip").jumpable(-1) then
                  vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
                else
                  fallback()
                end
              end, { 'i', 's'}),
            })
          '';
        };
        snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";
        preselect = "Item";
        formatting =
        {
          fields = [ "abbr" "kind" "menu" ];
          format =
            # lua
            ''
              function(_, item)
                local icons = {
                  Namespace = "󰌗",
                  Text = "󰉿",
                  Method = "󰆧",
                  Function = "󰆧",
                  Constructor = "",
                  Field = "󰜢",
                  Variable = "󰀫",
                  Class = "󰠱",
                  Interface = "",
                  Module = "",
                  Property = "󰜢",
                  Unit = "󰑭",
                  Value = "󰎠",
                  Enum = "",
                  Keyword = "󰌋",
                  Snippet = "",
                  Color = "󰏘",
                  File = "󰈚",
                  Reference = "󰈇",
                  Folder = "󰉋",
                  EnumMember = "",
                  Constant = "󰏿",
                  Struct = "󰙅",
                  Event = "",
                  Operator = "󰆕",
                  TypeParameter = "󰊄",
                  Table = "",
                  Object = "󰅩",
                  Tag = "",
                  Array = "[]",
                  Boolean = "",
                  Number = "",
                  Null = "󰟢",
                  String = "󰉿",
                  Calendar = "",
                  Watch = "󰥔",
                  Package = "",
                  Copilot = "",
                  Codeium = "",
                  TabNine = "",
                }

                local icon = icons[item.kind] or ""
                item.kind = string.format("%s %s", icon, item.kind or "")
                return item
              end
            '';
        };
        window = {
          completion = {
            winhighlight =
              "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None";
            scrollbar = false;
            sidePadding = 0;
            border = [ "╭" "─" "╮" "│" "╯" "─" "╰" "│" ];
          };

          documentation = {
            border = [ "╭" "─" "╮" "│" "╯" "─" "╰" "│" ];
            winhighlight =
              "FloatBorder:CmpBorder,Normal:CmpPmenu,CursorLine:CmpSel,Search:PmenuSel";
          };
        };
      };

    };
  };
}

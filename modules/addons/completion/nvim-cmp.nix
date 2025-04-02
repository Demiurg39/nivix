{
  helpers,
  config,
  opts,
  lib,
  ...
}: let
  cfg = config.addons.completion.nvim-cmp;
in {
  options.addons.completion.nvim-cmp.enable = lib.mkEnableOption "Enable completions wia nvim-cmp";

  config = lib.mkIf cfg.enable {
    addons.completion.copilot.enable = false;
    addons.completion.lspkind.enable = true;

    highlightOverride = {
      PMenu = {
        ctermbg = "none";
        bg = "none";
      };
    };

    plugins = {
      luasnip.enable = true;

      cmp_luasnip.enable = true;

      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          snippet.expand =
            # lua
            ''
              function(args)
                  require("luasnip").lsp_expand(args.body)
              end
            '';

          window = {
            documentation.border = "${opts.border}";
            completion = {
              border = "${opts.border}";
              scrollbar = false;
            };
          };

          sources = [
            {name = "nvim_lsp";}
            {name = "nvim_lsp_signature_help";}
            {name = "nvim_lsp_document_symbol";}
            {name = "treesitter";}
            {name = "luasnip";}
            {name = "buffer";}
            {name = "path";}
          ];

          mapping = helpers.mkRaw ''
            cmp.mapping.preset.insert({
              ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
              ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),

              ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
              ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),

              ["<C-q>"] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close() }),

              ["<C-cr>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = false }),

              ["<A-l>"] = cmp.mapping(function(fallback)
                local luasnip = require("luasnip")
                if luasnip.expand_or_locally_jumpable() then
                  luasnip.expand_or_jump()
                elseif luasnip.jumpable(1) then
                  luasnip.jump(1)
                else
                  fallback()
                end
              end, { "i", "s" }),

              ["<A-h>"] = cmp.mapping(function(fallback)
                local luasnip = require("luasnip")
                if luasnip.jumpable(-1) then
                  luasnip.jump(-1)
                else
                  fallback()
                end
              end, { "i", "s" }),

            })
          '';
        };
      };
    };
  };
}

{ mkKey, helpers, ... }: let
  inherit (mkKey) mkKeymap;
in {

  plugins = {
    nvim-ufo = {
      enable = true;
      settings = {
        provider_selector = # lua
          ''
            function()
                return { "lsp", "indent" }
            end
          '';
        preview.mappings = {
          close = "q";
          switch = "k";
        };
      };
    };
  };

  opts = {
    foldcolumn = "1";
    foldlevel = 99;
    foldlevelstart = 99;
    foldenable = true;
    fillchars = (helpers.mkRaw ''[[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]'');
  };

  keymaps = [
    (mkKeymap "n" "zR" "<cmd>lua require('ufo').openAllFolds()<cr>" "Open all folds")
    (mkKeymap "n" "zM" "<cmd>lua require('ufo').closeAllFolds()<cr>" "Close All Folds")
    (mkKeymap "n" "zK"
      (helpers.mkRaw #lua
        ''
          function()
            local winid = require("ufo").peekFoldedLinesUnderCursor()
            if not winid then
              vim.lsp.buf.hover()
            end
          end
        '')
      "Peek Folded Lines")
  ];

}

{ mkKey, opts, lib, pkgs, ... }: let
  inherit (mkKey) mkKeymap;
in {

  plugins.conform-nvim = {
    enable = true;
    settings = {
      default_format_opts.lsp_format = "${opts.lsp_format}";
      formatters_by_ft = {
        "_" = [
          "squeeze_blanks"
          "trim_whitespace"
          "trim_newlines"
        ];
      };
      formatters = {
        squeeze_blanks = {
          command = lib.getExe' pkgs.coreutils "Cat";
        };
      };
    };
  };

  keymaps = [ ( mkKeymap "n" "<leader>lf" "<cmd>lua require('conform').format()<cr>" "Format Buffer") ];

}

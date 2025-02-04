{
  mkKeymap,
  config,
  pkgs,
  lib,
  ...
}: let
  cfg = config.addons.lsp.formatter;
in {
  options.addons.lsp.formatter = with lib.types; {
    enable = lib.mkEnableOption "Enable formatter module";
    lsp_format = lib.mkOption {
      type = types.str;
      default = "fallback";
      description = ''
        option passed to Conform
        never: never use the LSP for formatting.
        fallback: LSP formatting is used when no other formatters are available.
        prefer: Use only LSP formatting when available.
        first: LSP formatting is used when available and then other formatters.
        last: Other formatters are used then LSP formatting when available.
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    plugins.conform-nvim = {
      enable = true;
      settings = {
        default_format_opts.lsp_format = "${cfg.lsp_format}";
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
    keymaps = [(mkKeymap "n" "<leader>lf" "<cmd>lua require('conform').format()<cr>" "Format Buffer")];
  };
}

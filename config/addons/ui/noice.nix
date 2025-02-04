{
  config,
  lib,
  ...
}: let
  cfg = config.addons.ui.noice;
in {
  options.addons.ui.noice.enable = lib.mkEnableOption "Enable noice module";

  config = lib.mkIf cfg.enable {
    plugins.noice = {
      enable = true;
      settings = {
        lsp = {
          override = {
            "vim.lsp.util.convert_input_to_markdown_lines" = true;
            "vim.lsp.util.stylize_markdown" = true;
            "cmp.entry.get_documentation" = true;
          };
          hover.enabled = false;
          messages.enabled = false;
          signature.enabled = false;
          progress.enabled = false;
        };
      };
    };
  };
}

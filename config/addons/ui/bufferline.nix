{
  config,
  lib,
  ...
}: let
  cfg = config.addons.ui.bufferline;
in {
  options.addons.ui.bufferline.enable = lib.mkEnableOption "Enable bufferline module";

  config = lib.mkIf cfg.enable {
    plugins.bufferline = {
      enable = true;
      settings.options = {
        diagnostics = "nvim_lsp";
        truncatedNames = true;
        offsets = [
          {
            filetype = "undotree";
            text = "Undotree";
            highlight = "PanelHeading";
            padding = 1;
          }
          {
            filetype = "neo-tree";
            text = "Explorer";
            highlight = "PanelHeading";
            padding = 1;
          }
          {
            filetype = "NvimTree";
            text = "Explorer";
            highlight = "PanelHeading";
            padding = 1;
          }
          {
            filetype = "DiffviewFiles";
            text = "Diff View";
            highlight = "PanelHeading";
            padding = 1;
          }
          {
            filetype = "flutterToolsOutline";
            text = "Flutter Outline";
            highlight = "PanelHeading";
          }
        ];
      };
    };
  };
}

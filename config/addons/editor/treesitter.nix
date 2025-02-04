{
  config,
  lib,
  ...
}: let
  cfg = config.addons.editor.treesitter;
in {
  options.addons.editor.treesitter.enable = lib.mkEnableOption "Enable treesitter module";

  config = lib.mkIf cfg.enable {
    plugins = {
      treesitter = {
        enable = true;
        settings = {
          highlight.enable = true;
          incremental_selection.enable = true;
          indent.enable = true;
        };
      };
      treesitter-textobjects.enable = true;
    };
  };
}

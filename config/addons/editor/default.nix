{
  config,
  self,
  lib,
  ...
}: let
  cfg = config.addons.editor;
in {
  options.addons.editor.enable = lib.mkEnableOption "Enable editor module";

  imports = self.lib.nivixlib.readFiles ./.;

  config = lib.mkIf cfg.enable {
    addons.editor = {
      neo-tree.enable = true;
      smart-splits.enable = true;
      telescope.enable = true;
      treesitter.enable = true;
    };
  };
}

{
  config,
  self,
  lib,
  ...
}: let
  cfg = config.addons.lsp;
in {
  options.addons.lsp.enable = lib.mkEnableOption "Enable lsp module";

  imports = self.lib.nivixlib.readFiles ./.;

  config = lib.mkIf cfg.enable {
    addons.lsp = {
      formatter.enable = true;
      lspsaga.enable = true;
      trouble.enable = true;
    };
  };
}

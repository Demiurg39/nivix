{
  config,
  self,
  lib,
  ...
}: let
  cfg = config.langs;
in {
  imports = self.lib.nivixlib.readFiles ./.;

  options.langs.enable = lib.mkEnableOption "Enable language modules";

  config = lib.mkIf cfg.enable {
    langs = {
      c.enable = false;
      java.enable = false;
      lua.enable = false;
      markdown.enable = false;
      nix.enable = true;
      python.enable = false;
      shell.enable = false;
      typst.enable = false;
    };
  };
}

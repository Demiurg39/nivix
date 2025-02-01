{
  config,
  lib,
  ...
}: let
  cfg = config.langs.shell;
in {
  options.langs.shell = {
    enable = lib.mkEnableOption "Enable shell language module";
  };

  config = lib.mkIf cfg.enable {};
}

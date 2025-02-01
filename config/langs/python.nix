{
  config,
  lib,
  ...
}: let
  cfg = config.langs.python;
in {
  options.langs.python = {
    enable = lib.mkEnableOption "Enable python language module";
  };

  config = lib.mkIf cfg.enable {};
}

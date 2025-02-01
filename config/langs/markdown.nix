{
  config,
  lib,
  ...
}: let
  cfg = config.langs.markdown;
in {
  options.langs.markdown = {
    enable = lib.mkEnableOption "Enable markdown language module";
  };

  config = lib.mkIf cfg.enable {};
}

{
  config,
  lib,
  ...
}: let
  cfg = config.addons.completion.blink-cmp;
in {
  options.addons.completion.blink-cmp.enable = lib.mkEnableOption "Enable completions wia blink-cmp";

  config = lib.mkIf cfg.enable {};
}

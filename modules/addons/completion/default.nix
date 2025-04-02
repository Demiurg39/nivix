{
  config,
  self,
  lib,
  ...
}: let
  cfg = config.addons.completion;
in {
  options.addons.completion.enable = lib.mkEnableOption "Enable completions module";

  imports = self.lib.nivixlib.readFiles ./.;

  config = lib.mkIf cfg.enable {
    addons.completion = {
      nvim-cmp.enable = true;
      blink-cmp.enable = false;
    };
  };
}

{
  specObj,
  config,
  opts,
  lib,
  ...
}: let
  cfg = config.addons.ui.which-key;
in {
  options.addons.ui.which-key.enable = lib.mkEnableOption "Enable which-key module";
  options.wKeyList = lib.mkOption {
    type = lib.types.listOf lib.types.attrs;
    description = "needed for which-key icons";
  };

  config = lib.mkIf cfg.enable {
    plugins.which-key = {
      enable = true;
      settings = {
        win.wo = { inherit (opts) winblend; };
        spec = config.wKeyList;
      };
    };

    wKeyList = [
      (specObj ["<leader>A" "" "" "true"])
      (specObj ["<leader><leader>" "" "" "true"])
      (specObj ["<leader><tab>" "" "tabs"])
      (specObj ["<leader>u" "󰔎" "ui"])
      (specObj ["<leader>|" "" "vsplit"])
      (specObj ["<leader>-" "" "split"])
      (specObj ["z" "" "fold"])
      (specObj ["g" "" "goto"])
      (specObj ["[" "" "next"])
      (specObj ["]" "" "prev"])
    ];
  };
}

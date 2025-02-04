{
  mkKeymap,
  specObj,
  config,
  lib,
  ...
}: let
  cfg = config.addons.utils.auto-session;
in {
  options.addons.utils.auto-session.enable = lib.mkEnableOption "Enable auto-session module";

  config = lib.mkIf cfg.enable {
    plugins.auto-session = {
      enable = true;
      settings = {
        auto-save = true;
        auto-restore = false;
      };
    };

    keymaps = [
      (mkKeymap "n" "<leader>q." "<cmd>SessionRestore<CR>" "Last Session")
      (mkKeymap "n" "<leader>ql" "<cmd>Autosession search<CR>" "List Session")
      (mkKeymap "n" "<leader>qd" "<cmd>Autosession delete<CR>" "Delete Session")
      (mkKeymap "n" "<leader>qs" "<cmd>SessionSave<CR>" "Save Session")
      (mkKeymap "n" "<leader>qD" "<cmd>SessionPurgeOrphaned<CR>" "Purge Orphaned Sessions")
    ];

    wKeyList = lib.mkIf config.addons.ui.which-key.enable [(specObj ["<leader>q" "" "session"])];
  };
}

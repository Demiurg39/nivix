{
  mkKeymap,
  config,
  lib,
  ...
}: let
  cfg = config.addons.editor.smart-splits;
in {
  options.addons.editor.smart-splits.enable = lib.mkEnableOption "Enable smart-splits module";

  config = lib.mkIf cfg.enable {
    plugins.smart-splits.enable = true;

    keymaps = [
      (mkKeymap "n" "<C-h>" "<cmd>lua require('smart-splits').move_cursor_left()<cr>" "Move: cursor Left")
      (mkKeymap "n" "<C-j>" "<cmd>lua require('smart-splits').move_cursor_down()<cr>" "Move: cursor Down")
      (mkKeymap "n" "<C-k>" "<cmd>lua require('smart-splits').move_cursor_up()<cr>" "Move: cursor Up")
      (mkKeymap "n" "<C-l>" "<cmd>lua require('smart-splits').move_cursor_right()<cr>" "Move: cursor Right")

      (mkKeymap "n" "<A-h>" "<cmd>lua require('smart-splits').resize_left()<cr>" "Resize: Left")
      (mkKeymap "n" "<A-j>" "<cmd>lua require('smart-splits').resize_down()<cr>" "Resize: Down")
      (mkKeymap "n" "<A-k>" "<cmd>lua require('smart-splits').resize_up()<cr>" "Resize: Up")
      (mkKeymap "n" "<A-l>" "<cmd>lua require('smart-splits').resize_right()<cr>" "Resize: Right")
    ];
  };
}

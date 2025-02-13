{
  mkKeymap,
  specObj,
  config,
  icons,
  lib,
  ...
}: let
  cfg = config.addons.editor.neo-tree;
in {
  options.addons.editor.neo-tree.enable = lib.mkEnableOption "Enable neo-tree module";

  config = lib.mkIf cfg.enable {
    plugins.neo-tree = {
      enable = true;
      usePopupsForInput = false;
      extraSources = ["document_symbols"];
      sourceSelector.winbar = true;
      buffers.followCurrentFile.enabled = true;
      filesystem.window.mappings."F" = "fuzzy_finder_directory";
      defaultComponentConfigs = {
        diagnostics.symbols = {
          hint = "${icons.diagnostics.BoldHint}";
          info = "${icons.diagnostics.BoldInformation}";
          warn = "${icons.diagnostics.BoldWarning}";
          error = "${icons.diagnostics.BoldError}";
        };
        gitStatus.symbols = {
          unstaged = "${icons.git.FileUnstaged}";
          staged = "${icons.git.FileStaged}";
          renamed = "${icons.git.FileRenamed}";
          untracked = "${icons.git.FileUntracked}";
          deleted = "${icons.git.FileDeleted}";
          ignored = "${icons.git.FileIgnored}";
        };
      };
      window = {
        position = "left";
        width = 25;
        autoExpandWidth = false;
        mappings = {
          "s" = "open_split";
          "v" = "open_vsplit";
          "<space>" = "none";
          "K" = "focus_preview";
          "P" = {
            command = "toggle_preview";
            config.use_float = true;
          };
        };
      };
    };

    keymaps = [(mkKeymap "n" "<leader>e" "<cmd>Neotree toggle<cr>" "Explorer NeoTree (cwd)")];
    wKeyList = lib.mkIf config.addons.ui.which-key.enable [(specObj ["<leader>e" ""])];
  };
}

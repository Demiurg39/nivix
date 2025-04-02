{
  mkKeymap,
  specObj,
  config,
  icons,
  lib,
  ...
 }: let
  cfg = config.addons.ui.gitsigns;
in {
  options.addons.ui.gitsigns.enable = lib.mkEnableOption "Enable gitsigns module";

  config = lib.mkIf cfg.enable {
    plugins.gitsigns = {
      enable = true;
      settings = {
        current_line_blame = true;
        signs = {
          add = { text = "${icons.ui.LineLeft}"; };
          change = { text = "${icons.ui.LineLeft}"; };
          delete = { text = "${icons.ui.LineLeft}"; };
          topdelete = { text = "${icons.ui.Triangle}"; };
          changedelete = { text = "${icons.ui.BoldLineLeft}"; };
        };
      };
    };

    keymaps = [
      (mkKeymap "n" "<leader>ghS" "<cmd>lua require('gitsigns').stage_buffer()<cr>"              "Stage Buffer")
      (mkKeymap "n" "<leader>ghu" "<cmd>lua require('gitsigns').undo_stage_hunk()<cr>"           "Undo Stage Hunk")
      (mkKeymap "n" "<leader>ghR" "<cmd>lua require('gitsigns').reset_buffer()<cr>"              "Reset Buffer")
      (mkKeymap "n" "<leader>ghp" "<cmd>lua require('gitsigns').preview_hunk_inline()<cr>"       "Preview Hunk Inline")
      (mkKeymap "n" "<leader>ghb" "<cmd>lua require('gitsigns').blame_line({ full = true })<cr>" "Blame Line")
      (mkKeymap "n" "<leader>ghB" "<cmd>lua require('gitsigns').blame()<cr>"                     "Blame Buffer")
      (mkKeymap "n" "<leader>gb" "<cmd>lua require('gitsigns').blame_line()<cr>"                 "Blame")
      (mkKeymap "n" "<leader>ghd" "<cmd>lua require('gitsigns').diffthis()<cr>"                  "Diff This")
      (mkKeymap "n" "<leader>ghD" "<cmd>lua require('gitsigns').diffthis('~')<cr>"               "Diff This ~")

      (mkKeymap "n" "]H" "<cmd>lua require ('gitsigns').nav_hunk('last')<cr>"  "Last Hunk")
      (mkKeymap "n" "[H" "<cmd>lua require ('gitsigns').nav_hunk('first')<cr>" "First Hunk")

      (mkKeymap "n" "<leader>ghs" ":Gitsigns stage_hunk<cr>" "Stage Hunk")
      (mkKeymap "n" "<leader>ghr" ":Gitsigns reset_hunk<cr>" "Reset Hunk")

      (mkKeymap "v" "<leader>ghs" ":Gitsigns stage_hunk<cr>" "Stage Hunk")
      (mkKeymap "v" "<leader>ghr" ":Gitsigns reset_hunk<cr>" "Reset Hunk")

      # (mkKeymap "o" "ih" ":<C-U>Gitsigns select_hunk<cr>"    "GitSigns Select Hunk")
      # (mkKeymap "x" "ih" ":<C-U>Gitsigns select_hunk<cr>"    "GitSigns Select Hunk")
    ];

    wKeyList = lib.mkIf config.addons.ui.which-key.enable [
      (specObj [ "<leader>g" "" "git" ])
      (specObj [ "<leader>gh" "" "hunks" ])
    ];
  };



}

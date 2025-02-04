{
  mkKeymap,
  specObj,
  helpers,
  config,
  pkgs,
  lib,
  ...
}: let
  cfg = config.addons.editor.telescope;
in {
  options.addons.editor.telescope.enable = lib.mkEnableOption "Enable telescope module";

  config = lib.mkIf cfg.enable {
    plugins.telescope = {
      enable = true;
      extensions = {
        fzf-native.enable = true;
        undo.enable = true;
      };
      settings = {
        pickers = {
          find_files = {
            hidden = true;
            find_command = helpers.listToUnkeyedAttrs ["${lib.getExe pkgs.ripgrep}" "--files" "--color" "never" "-g" "!.git"];
          };
          colorscheme.enable_preview = true;
        };
        defaults = {
          sorting_strategy = "ascending";
          layout_config.horizontal = {
            preview_width = 0.55;
            prompt_position = "top";
          };
          mappings = {
            n = {
              q = helpers.mkRaw "require('telescope.actions').close";
              h = helpers.mkRaw "require('telescope.actions').select_horizontal";
              v = helpers.mkRaw "require('telescope.actions').select_vertical";
            };
            i = {
              "<C-j>" = "move_selection_next";
              "<C-k>" = "move_selection_previous";
              "<leader>q" = "close";
            };
          };
        };
      };
    };

    keymaps = [
      (mkKeymap "n" "<leader>," "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>" "Switch Buffer")
      (mkKeymap "n" "<leader>:" "<cmd>Telescope command_history<cr>" "Command History")

      (mkKeymap "n" "]t" "<cmd>lua require('todo-comments').jump_next()<cr>" "Next Todo Comment")
      (mkKeymap "n" "[t" "<cmd>lua require('todo-comments').jump_prev()<cr>" "Previous Todo Comment")

      # find
      (mkKeymap "n" "<leader>ff" "<cmd>Telescope find_files<cr>" "Find Files (Root Dir)")
      (mkKeymap "n" "<leader>fb" "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>" "Buffers")
      (mkKeymap "n" "<leader>fg" "<cmd>Telescope live_grep<cr>" "Grep (cwd)")
      (mkKeymap "n" "<leader>fG" "<cmd>Telescope git_files<CR>" "Find Files (git-files)")
      (mkKeymap "n" "<leader>fr" "<cmd>Telescope oldfiles<cr>" "Recent files")

      # git
      (mkKeymap "n" "<leader>gc" "<cmd>Telescope git_commits<CR>" "Commits")
      (mkKeymap "n" "<leader>gs" "<cmd>Telescope git_status<CR>" "Status")

      # search
      (mkKeymap "n" "<leader>s'" "<cmd>Telescope registers<cr>" "Registers")
      (mkKeymap "n" "<leader>s/" "<cmd>Telescope current_buffer_fuzzy_find<cr>" "Buffer")
      (mkKeymap "n" "<leader>s:" "<cmd>Telescope commands<cr>" "Commands")
      (mkKeymap "n" "<leader>sd" "<cmd>Telescope diagnostics bufnr=0<cr>" "Document Diagnostics")
      (mkKeymap "n" "<leader>sD" "<cmd>Telescope diagnostics<cr>" "Workspace Diagnostics")
      (mkKeymap "n" "<leader>st" "<cmd>TodoTelescope<cr>" "Todo")
      (mkKeymap "n" "<leader>sT" "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>" "Todo/Fix/Fixme")
      (mkKeymap "n" "<leader>sm" "<cmd>Telescope man_pages<cr>" "Man Pages")
      (mkKeymap "n" "<leader>su" "<cmd>Telescope undo<cr>" "Undo")
      (mkKeymap "n" "<leader>sq" "<cmd>Telescope quickfix<cr>" "Quickfix List")
    ];

    wKeyList = lib.mkIf config.addons.ui.which-key.enable [
      (specObj ["<leader>s" "" "search"])
      (specObj ["<leader>f" "" "file/find"])
      (specObj ["<leader>:" ""])
    ];
  };
}

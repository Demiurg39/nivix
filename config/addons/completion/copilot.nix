{
  mkKeymap,
  specObj,
  helpers,
  config,
  lib,
  ...
}: let
  cfg = config.addons.completion.copilot;
in {
  options.addons.completion.copilot.enable = lib.mkEnableOption "Enable copilot-nvim module";

  config = lib.mkIf cfg.enable {
    plugins.copilot-lua = {
      enable = true;
      settings = {
        filetypes = {
          markdown = true;
          "*" = false;
        };
        suggestion = {
          enabled = true;
          autoTrigger = true;
        };
      };
    };

    keymaps = [
      (mkKeymap "n" "<leader>ac"
        (helpers.mkRaw # lua

          ''
            function()
              if vim.g.copilot_status == nil then
                vim.g.copilot_status = "running"
              end
              if vim.g.copilot_status == "running" then
                vim.g.copilot_status = "stopped"
                vim.cmd("Copilot disable")
              else
                vim.g.copilot_status = "running"
                vim.cmd("Copilot enable")
              end
            end
          '')
        "Toggle Copilot")

      (mkKeymap "n" "<C-cr>" "<cmd>Copilot suggestion accept<cr>" "Copilot accept suggestion")
      (mkKeymap "n" "<C-bs>" "<cmd>Copilot suggestion dismiss<cr>" "Copilot dismiss suggestion")
      (mkKeymap "n" "<C-]>" "<cmd>Copilot suggestion next<cr>" "Copilot next suggestion")
      (mkKeymap "n" "<C-[>" "<cmd>Copilot suggestion prev<cr>" "Copilot prev suggestion")
    ];

    wKeyList = lib.mkIf config.addons.ui.which-key.enable [(specObj ["<leader>a" "󰚩" "ai"])];
  };
}

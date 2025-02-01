{
  mkKeymap,
  specObj,
  helpers,
  ...
}: {
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

  wKeyList = [(specObj ["<leader>a" "󰚩" "ai"])];

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
}

{
  opts,
  lib,
  config,
  specObj,
  ...
}: {
  options.wKeyList = lib.mkOption {
    type = lib.types.listOf lib.types.attrs;
    description = "needed for which-key icons";
  };

  config = {
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
      (specObj ["<leader>q" "" "session"])
      (specObj ["<leader><tab>" "" "tabs"])
      (specObj ["z" "" "fold"])
      (specObj ["g" "" "goto"])
      (specObj ["[" "" "next"])
      (specObj ["]" "" "prev"])
      (specObj ["<leader>u" "󰔎" "ui"])
      (specObj ["<leader>|" "" "vsplit"])
      (specObj ["<leader>-" "" "split"])
    ];
  };
}

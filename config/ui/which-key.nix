{ opts, lib, config, ... }: {

  options.wKeyList = lib.mkOption {
    type = lib.types.listOf lib.types.attrs;
    description = "needed for which-key icons";
  };

  config.plugins.which-key = {
      enable = true;
      settings = {
      win.wo = { inherit (opts) winblend; };
      spec = config.wKeyList;
      };
    };

}

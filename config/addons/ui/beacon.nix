{ inputs, mkPkgs, lib, ... }: {

  plugins.lz-n.enable = lib.mkDefault true;

  extraPlugins = [
    (mkPkgs "beacon" inputs.beacon)
  ];

  extraConfigLua =
    ''
      require("lz.n").load{
        {
          "beacon.nvim",
          event = "CursorMoved",
          after = function()
            require('beacon').setup()
          end,
        },
      }
    '';

}

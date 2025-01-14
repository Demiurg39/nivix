{ lib, ... }: let 
  inherit (lib) types;
in {

  flake.options = {
    opts = {
      border = lib.mkOption {
        type = types.str;
        default = "rounded";
        description = "type of bordered to be used";
      };

      winblend = lib.mkOption {
        type = types.int;
        default = 12;
        description = "The blend of other windows.";
      };

      transparent = lib.mkEnableOption "enable transparency" // { default = true; };
    };
  };

}

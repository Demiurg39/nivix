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

      lsp_format = lib.mkOption {
        type = types.str;
        default = "fallback";
        description = 
        ''
          option passed to Conform
          never: never use the LSP for formatting.
          fallback: LSP formatting is used when no other formatters are available.
          prefer: Use only LSP formatting when available.
          first: LSP formatting is used when available and then other formatters.
          last: Other formatters are used then LSP formatting when available.
        '';
      };
    };
  };

}

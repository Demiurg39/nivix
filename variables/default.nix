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

      dashboard = {
        wall = lib.mkOption {
          type = types.path;
          default = ./dashboard.png;
          description = "img which appears at dashboard";
        };
        symbols = lib.mkOption {
          type = types.str;
          default = "sextant";
          description =
          ''
            Specify character symbols to employ in final output.
            Accepted classes for
            all        ascii   braille   extra      imported  narrow   solid      ugly
            alnum      bad     diagonal  geometric  inverted  none     space      vhalf
            alpha      block   digit     half       latin     quad     stipple    wedge
            ambiguous  border  dot       hhalf      legacy    sextant  technical  wide

            These can be combined with + and -, e.g. block+border-diagonal or all-wide.
          '';
        };
        fg-only = lib.mkOption {
            type = lib.types.bool;
            default = false;
            description = "If true, includes '--fg-only' in the command; otherwise, excludes it.";
        };
        # TODO: add command option for runnig specified command instead of chafa
      };

    };
  };

}

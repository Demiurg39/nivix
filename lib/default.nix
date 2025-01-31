{ lib, pkgs, ... }: {

  mkKey = rec {
    mkKeymap = mode: key: action: desc: {
      inherit key;
      inherit mode;
      inherit action;
      options = {
        inherit desc;
        silent = true;
        noremap = true;
        remap = true;
      };
    };

    mkKeymap' = key: mode: action: (mkKeymap key mode action null);
  };

  mkPkgs = name: src: pkgs.vimUtils.buildVimPlugin { inherit name src; };

  specObj = # with builtins;
    list: let
      len = builtins.length list;
      first = lib.optionalAttrs (builtins.elemAt list 0 != "") { __unkeyed = builtins.elemAt list 0; };
      second = lib.optionalAttrs (builtins.elemAt list 1 != "") { icon = builtins.elemAt list 1; };
      third = lib.optionalAttrs (len > 2 && builtins.elemAt list 2 != "") { group = builtins.elemAt list 2; };
      fourth = lib.optionalAttrs (len > 3 && builtins.elemAt list 3 != "") { hidden = builtins.elemAt list 3; };
    in
    first // second // third // fourth;

  icons = import ./icons.nix;

}

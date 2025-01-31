{
  lib,
  pkgs,
  ...
}: rec {

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

  mkPkgs = name: src: pkgs.vimUtils.buildVimPlugin { inherit name src; };

  # TODO: substitute all mkKey to mkKeymap
  mkKey = {inherit mkKeymap;};

  specObj = list: let
      len = builtins.length list;
      first = lib.optionalAttrs (builtins.elemAt list 0 != "") { __unkeyed = builtins.elemAt list 0; };
      second = lib.optionalAttrs (builtins.elemAt list 1 != "") { icon = builtins.elemAt list 1; };
      third = lib.optionalAttrs (len > 2 && builtins.elemAt list 2 != "") { group = builtins.elemAt list 2; };
      fourth = lib.optionalAttrs (len > 3 && builtins.elemAt list 3 != "") { hidden = builtins.elemAt list 3; };
    in
    first // second // third // fourth;

  icons = import ./icons.nix;

}

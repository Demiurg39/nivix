{ lib, ... }: {
  flake.lib = {
    nivixlib = rec {
      readFiles = dir:
        let
          content = builtins.attrNames (builtins.readDir dir);
          files = builtins.filter (fn: fn != "default.nix") content;
        in
        builtins.concatMap
          (
            fn:
            let path = "${dir}/${fn}"; in
            if builtins.pathExists path && lib.pathIsDirectory path then readFiles path else [ path ]
          ) files ;
    };
  };

}

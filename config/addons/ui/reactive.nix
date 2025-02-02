{ inputs, mkPkgs, ... }: {

  extraPlugins = [
    (mkPkgs "reactive" inputs.reactive)
  ];

  extraConfigLua = # lua
    ''
      require("reactive").setup({
        builtin = {
          cursorline = true,
          cursor = true,
          modemsg = true,
        },
      })
    '';

}

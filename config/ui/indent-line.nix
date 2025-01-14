{ ... }: {

  plugins = {
    mini.enable = true;
    indent-blankline = {
      enable = true;
      settings = {
          indent.char = "│";
          exclude.filetypes = [ "''" "lspinfo" "dashboard" "checkhealth" ];
      };
    };
  };

  extraConfigLua = ''
    require('mini.indentscope').setup({
      symbol = "│",
    })
  '';

}

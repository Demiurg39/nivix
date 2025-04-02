{
  helpers,
  inputs,
  config,
  mkPkgs,
  lib,
  ...
}: let
  cfg = config.langs.typst;
in {
  options.langs.typst = {
    enable = lib.mkEnableOption "Enable typst language module";
    # preview = lib.nixvim.defaultNullOpts.mkEnumFirstDefault [
    #   "zathura"
    #   "typst-preview"
    # ];
  };

  config = lib.mkIf cfg.enable {
    plugins.lsp.servers.tinymist = {
      enable = true;
      settings = {
        formatterMode = "typstyle";
        # exportPdf = if (cfg.preview == "zathura") then "onType" else "never";
        rootPath = ''require("lspconfig")["tinymist"].setup { root_dir }'';
        compileStatus = "disable";
      };
    };

    # extraPlugins = lib.mkIf (cfg.preview == "typst-preview") [(mkPkgs "typst-preview" inputs.typst-preview)];
    #
    # extraConfigLua = if (cfg.preview == "typst-preview") then ''
    #   require("typst-preview").setup()
    # '' else "";

    # userCommands.OpenPdf = {
    #   command = helpers.mkRaw ''
    #     function()
    #       local filepath = vim.api.nvim_buf_get_name(0)
    #       if filepath:match("%.typ$") then
    #         os.execute "zathura " .. vim.fn.shellescape(filepath:gsub("%.typ$", ".pdf"))
    #     end
    #   '';
    # };
  };
}

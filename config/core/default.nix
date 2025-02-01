{
  opts,
  icons,
  self,
  ...
}: {
  imports = self.lib.nivixlib.readFiles ./.;

  enableMan = true;
  viAlias = true;
  vimAlias = true;

  globals = {
    mapleader = " ";
    floating_window_options = {
      border = "${opts.border}";
      inherit (opts) winblend;
    };
  };

  plugins = {
    comment.enable = true;
    nvim-autopairs.enable = true;
  };

  extraConfigLua = ''
    local signs = {
      Hint = "${icons.diagnostics.BoldHint}",
      Info = "${icons.diagnostics.BoldInformation}",
      Warn = "${icons.diagnostics.BoldWarning}",
      Error = "${icons.diagnostics.BoldError}",
    }

    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define( hl, { text = icon, texthl = hl, numhl = hl })
    end

    vim.diagnostic.config({
      virtual_text = false,
      underline = true,
      signs = true,
      severity_sort = true,
      float = {
        border = "${opts.border}",
        source = "always",
        focusable = false,
      }
    })
  '';
}

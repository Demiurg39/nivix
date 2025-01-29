{ mkKey, helpers, ... }:
let
  inherit (mkKey) mkKeymap;
in
{

  plugins.snacks.settings.terminal.win.style.keys.term_normal = (helpers.listToUnkeyedAttrs [
    "<esc>"
    (helpers.mkRaw ''
      function(self)
        self.esc_timer = self.esc_timer or (vim.uv or vim.loop).new_timer()
        if self.esc_timer:is_active() then
          self.esc_timer:stop()
          vim.cmd("stopinsert")
        else
          self.esc_timer:start(200, 0, function() end)
          return "<esc>"
        end
      end
    '')
  ]) // {
    mode = "t";
    expr = true;
    desc = "double escape to normal mode";
  };

  keymaps = [
    (mkKeymap "n" "<c-/>" "<cmd>lua Snacks.terminal()<cr>" "Toggle Terminal")
    (mkKeymap "t" "<c-/>" "<cmd>lua Snacks.terminal()<cr>" "Toggle Terminal")
  ];

}

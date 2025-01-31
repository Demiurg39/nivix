{
  mkKeymap,
  specObj,
  helpers,
  ...
}: let

  insert = [
    (mkKeymap "i" "<C-b>" "<Esc>^i" "Move: beginning of line")
    (mkKeymap "i" "<C-e>" "<End>" "Move: end of line")
    (mkKeymap "i" "<C-h>" "<Left>" "Move: Left")
    (mkKeymap "i" "<C-j>" "<Down>" "Move: Down")
    (mkKeymap "i" "<C-k>" "<Up>" "Move: Up")
    (mkKeymap "i" "<C-l>" "<Right>" "Move: Right")
  ];
  normal = [
    (mkKeymap "n" "<Esc>" "<cmd>nohl<cr>" "turn off text highlighting")

    (mkKeymap "n" "<A-i>" "<cmd>bnext<cr>" "Buffer: Next")
    (mkKeymap "n" "<A-m>" "<cmd>bprev<cr>" "Buffer: Previous")
    (mkKeymap "n" "<A-q>"
      (helpers.mkRaw # lua

        ''
          function()
            local wins = vim.api.nvim_tabpage_list_wins(0)
            local non_floating_wins = 0

            -- Count non-floating windows
            for _, win in ipairs(wins) do
              local config = vim.api.nvim_win_get_config(win)
              if not config.relative or config.relative == "" then
                non_floating_wins = non_floating_wins + 1
              end
            end

            -- Close window or buffer based on the number of non-floating windows
            if non_floating_wins > 1 then
              vim.cmd("close")
            elseif #vim.fn.getbufinfo({buflisted = 1}) > 1 then
              vim.cmd('bdelete')  -- Delete the buffer if more than one buffer is open
            else
              vim.cmd('quit')  -- Quit Neovim if it's the last buffer
            end
          end
        '')
      "Buffer Close")

    (mkKeymap "n" "<leader><tab>i" "<cmd>tabn<cr>" "Tab: Next Tab")
    (mkKeymap "n" "<leader><tab>m" "<cmd>tabp<cr>" "Tab: Previous Tab")
    (mkKeymap "n" "<leader><tab>n" "<cmd>tabnew<cr>" "Tab: new Tab")

    (mkKeymap "n" "<leader>sv" "<cmd>vsplit<cr>" "Window: split vertically")
    (mkKeymap "n" "<leader>sh" "<cmd>split<cr>" "Window: split horizontally")
  ];
  visual = [
    (mkKeymap "v" ">" ">gv" "Indent: increment")
    (mkKeymap "v" "<" "<gv" "Indent: decrement")

    (mkKeymap "v" "<A-j>" ":m '>+1<cr>gv=gv" "Move: line Down")
    (mkKeymap "v" "<A-k>" ":m '<-2<cr>gv=gv" "Move: line Up")
  ];
in {
  keymaps = insert ++ normal ++ visual;

  wKeyList = [
    (specObj ["<leader>A" "" "" "true"])
    (specObj ["<leader><leader>" "" "" "true"])
    (specObj ["<leader>q" "" "session"])
    (specObj ["<leader><tab>" "" "tabs"])
    (specObj ["z" "" "fold"])
    (specObj ["g" "" "goto"])
    (specObj ["[" "" "next"])
    (specObj ["]" "" "prev"])
    (specObj ["<leader>u" "󰔎" "ui"])
    (specObj ["<leader>|" "" "vsplit"])
    (specObj ["<leader>-" "" "split"])
  ];
}

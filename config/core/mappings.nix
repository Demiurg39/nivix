{ mkKey, ... }: let
  inherit (mkKey) mkKeymap;

  insert = [
    (mkKeymap "i" "<C-b>" "<Esc>^i" "Move: beginning of line")
    (mkKeymap "i" "<C-e>" "<End>"   "Move: end of line")
    (mkKeymap "i" "<C-h>" "<Left>"  "Move: Left")
    (mkKeymap "i" "<C-j>" "<Down>"  "Move: Down")
    (mkKeymap "i" "<C-k>" "<Up>"    "Move: Up")
    (mkKeymap "i" "<C-l>" "<Right>" "Move: Right")
  ];
  normal = [
    (mkKeymap "n" "<Esc>" "<cmd>nohl<cr>" "turn off text highlighting")

    (mkKeymap "n" "<A-i>" "<Esc>:bnext<cr>" "Buffer: Next")
    (mkKeymap "n" "<A-m>" "<Esc>:bprev<cr>" "Buffer: Previous")

    (mkKeymap "n" "<leader><tab>i" "<cmd>tabn<cr>"     "Tab: Next Tab")
    (mkKeymap "n" "<leader><tab>m" "<cmd>tabp<cr>"     "Tab: Previous Tab")
    (mkKeymap "n" "<leader><tab>d" "<cmd>tabclose<cr>" "Tab: close Tab")
    (mkKeymap "n" "<leader><tab>n" "<cmd>tabnew<cr>"   "Tab: new Tab")

    (mkKeymap "n" "<leader>sv" "<cmd>vsplit<cr>" "Window: split vertically")
    (mkKeymap "n" "<leader>sh" "<cmd>split<cr>"  "Window: split horizontally")
    (mkKeymap "n" "<leader>sd" "<cmd>close<cr>"  "Window: close split")

  ];
  visual = [
    (mkKeymap "v" "<" "<gv" "Indent: increment")
    (mkKeymap "v" ">" ">gv" "Indent: decrement")

    (mkKeymap "v" "<A-j>" ":m '>+1<cr>gv=gv" "Move: line Down")
    (mkKeymap "v" "<A-k>" ":m '<-2<cr>gv=gv" "Move: line Up")
  ];

in {

  keymaps = insert ++ normal ++ visual;

}

{helpers, ...}: {
  clipboard.providers.wl-copy.enable = true;

  opts = {
    autoindent = true;
    autoread = true;
    autowrite = true;

    backspace = "indent,eol,start";
    backup = false;
    backupskip = "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim";
    breakat = "[[\ \	;:,!?]]";
    breakindentopt = "shift:2,min:20";

    clipboard = "unnamedplus";
    cmdheight = 1;
    cmdwinheight = 5;
    complete = ".,w,b,k";
    completeopt = "menuone,noinsert";
    concealcursor = "niv";
    conceallevel = 0;
    cursorcolumn = true;
    cursorline = true;

    diffopt = "filler,iwhite,internal,linematch:60,algorithm:patience";
    display = "lastline";

    encoding = "utf-8";
    equalalways = false;
    errorbells = false;
    expandtab = true;

    fileformats = "unix,mac,dos";
    foldenable = true;
    foldcolumn = "1";
    foldlevel = 99;
    foldlevelstart = 99;
    fillchars = helpers.mkRaw ''[[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]'';
    formatoptions = "1jcroql";

    grepformat = "%f:%l:%c:%m";
    grepprg = "rg --hidden --vimgrep --smart-case --";
    guicursor = "n-v-c-sm:block-blinkon500,i-ci-ve:ver25-blinkwait700-blinkoff400-blinkon250,r-cr-o:hor20-blinkon500";

    helpheight = 12;
    hidden = true;
    history = 2000;

    ignorecase = true;
    inccommand = "nosplit";
    incsearch = true;
    infercase = true;
    jumpoptions = "stack";

    laststatus = 3;
    linebreak = true;
    list = true;
    listchars = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←";

    magic = true;
    mousescroll = "ver:3,hor:6";

    number = true;

    previewheight = 12;
    pumblend = 0; # -- Do NOT adjust the following option (pumblend) if you're using transparent background
    pumheight = 15;

    redrawtime = 1500;
    relativenumber = true;
    ruler = true;

    scrolloff = 10;
    sessionoptions = "buffers,curdir,folds,help,tabpages,winpos,winsize";
    shada = "!,'500,<50,@100,s10,h";
    shiftround = true;
    shiftwidth = 4;
    shortmess = "aoOTIcF";
    showbreak = "↳  ";
    showcmd = false;
    showmode = false;
    showtabline = 0;
    sidescrolloff = 5;
    signcolumn = "yes";
    smartcase = true;
    smarttab = true;
    splitbelow = true;
    splitkeep = "screen";
    splitright = true;
    startofline = false;
    swapfile = false;
    switchbuf = "usetab,uselast";
    synmaxcol = 2500;

    tabstop = 4;
    termguicolors = true;
    timeout = true;
    timeoutlen = 300;
    ttimeout = true;
    ttimeoutlen = 0;

    undofile = true;
    updatetime = 300; # -- Please do NOT set `updatetime` to above 500, otherwise most plugins may not function correctly

    viewoptions = "folds,cursor,curdir";
    virtualedit = "block";
    visualbell = true;

    whichwrap = "h,l,<,>,[,],~";
    wildignore = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**";
    wildignorecase = true;
    winblend = 0; # -- Do NOT adjust the following option (winblend) if you're using transparent background
    winminwidth = 10;
    winwidth = 30;
    wrap = false;
    wrapscan = true;
    writebackup = false;
  };
}

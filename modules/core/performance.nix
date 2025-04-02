{...}: {
  # feature that enhances the way Neovim loads and executes Lua modules,
  # offering improved performance and flexibility.
  luaLoader.enable = true;

  performance.byteCompileLua = {
    enable = true;
    nvimRuntime = true;
    configs = true;
    plugins = true;
  };
}

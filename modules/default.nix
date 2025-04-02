{lib, ...}: {
  imports = [
    ./addons
    ./core
    ./integrations
    ./langs
  ];

  addons.enable = true;
  integrations.enable = false;
  langs.enable = true;
}

{
  hostname,
  vars,
  pkgs,
  ...
}: {
  nix.enable = true;

  nix.package = pkgs.nix;

  nixpkgs.hostPlatform = "aarch64-darwin";

  networking = {
    hostName = hostname;
    localHostName = hostname;
  };

  users.users.${vars.username}.home = "/Users/${vars.username}";

  system.stateVersion = 5;

  system.primaryUser = "${vars.username}";

  core = {
    yabai.enable = true;
    skhd.enable = true;
    simple-bar.enable = true;
  };
}

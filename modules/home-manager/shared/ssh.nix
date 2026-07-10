{
  system,
  config,
  ...
}: let
  home = config.home.homeDirectory;
in {
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    settings =
      {
        "*" = {
          AddKeysToAgent = "yes";
          ServerAliveInterval = 60;
        };
      }
      // (
        if (system != "aarch64-darwin")
        then {
          "github.com" = {
            Hostname = "github.com";
            User = "rodeyseijkens";
            IdentityFile = "${home}/.ssh/id_personal";
          };
        }
        else {
          "github.com-personal" = {
            Hostname = "github.com";
            User = "rodeyseijkens";
            IdentityFile = "${home}/.ssh/id_personal";
          };
        }
      );
  };
}

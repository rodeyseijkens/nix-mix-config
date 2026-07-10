{lib, config, ...}:
with lib; let
  cfg = config.core.simple-bar;
in {
  options.core.simple-bar = {
    enable = mkEnableOption "simple-bar status bar";
  };

  config = mkIf cfg.enable {};
}

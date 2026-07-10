{
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.herdr;
  herdrConfig = ''
    # Gruvb0x — Rodey's gruvbox-material-dark-hard variant of herdr's built-in gruvbox theme.
    # Base palette is gruvbox-dark (Pavel Pertsev), recoloured to match the Rodey Gruvb0x
    # base16 scheme defined in modules/core/stylix.nix (gruvbox-material-dark-hard with
    # base0B swapped to #458588). panel_bg is pinned to a solid gruvbox-material bg so the
    # sidebar/tab bar/status bar are fully opaque; the pane area stays translucent via the
    # terminal emulator (ghostty).

    [theme]
    name = "gruvbox"

    [theme.custom]
    panel_bg = "#282828"
    surface0 = "#665C54"
    surface1 = "#504945"
    surface_dim = "#3C3836"
    overlay0 = "#EBDBB2"
    overlay1 = "#BDAE93"
    text = "#FBF1C7"
    subtext0 = "#EBDBB2"
    accent = "#D79921"
    mauve = "#D16286"
    green = "#98971A"
    yellow = "#D79921"
    red = "#FB4934"
    blue = "#458588"
    teal = "#689D6A"
    peach = "#FE8019"

    [keys]
    prefix = "ctrl+i"

    [[keys.command]]
    key = "prefix+ctrl+g"
    type = "pane"
    command = "lazygit"
    description = "lazygit: open"

    [[keys.command]]
    key = "prefix+shift+r"
    type = "plugin_action"
    command = "persiyanov.reviewr.toggle"
    description = "reviewr: toggle sidebar"

    [ui]
    pane_gaps = false

    [ui.sound]
    enabled = false

    [session]
  '';

  herdrReviewrConfig = ''
    theme = "gruvbox"
    toggle_placement = "split"
    toggle_direction = "right"
    auto_open = true
  '';
in {
  options.modules.herdr = {
    enable = mkEnableOption "herdr";
  };

  config = mkIf cfg.enable {
    home.packages = [pkgs.herdr];

    xdg.configFile."herdr/config.toml".text = herdrConfig;
    xdg.configFile."herdr/plugins/config/persiyanov.reviewr/config.toml".text = herdrReviewrConfig;
  };
}

{
  lib,
  config,
  pkgs,
  vars,
  ...
 }:
with lib; let
  cfg = config.core.yabai;
  simpleBarEnabled = config.core.simple-bar.enable;
  yabaiPackage = pkgs.writeShellScriptBin "yabai" ''
    exec /opt/homebrew/bin/yabai "$@"
  '';
in {
  options.core.yabai = {
    enable =
      mkEnableOption "yabai window manager"
      // {
        default = true;
      };
    config = mkOption {
      type = types.attrsOf types.str;
      default = {};
      description = "Yabai configuration options";
    };
    extraConfig = mkOption {
      type = types.lines;
      default = "";
      description = "Extra yabai configuration";
    };
  };

  config = mkIf cfg.enable {
    services.jankyborders = {
      enable = true;
      active_color = "0xFF98971A";
      inactive_color = "0x00000000";
      style = "round";
      width = 5.0;
    };

    services.yabai = {
      enable = true;
      package = yabaiPackage;
      enableScriptingAddition = true;
      config =
        {
          # simple-bar expects yabai's external bar reservation so windows do not overlap it.
          focus_follows_mouse = "off";
          mouse_follows_focus = "off";
          window_placement = "second_child";
          window_opacity = "on";
          window_opacity_duration = "0.0";
          active_window_border_topmost = "off";
          window_topmost = "on";
          window_shadow = "float";
          active_window_opacity = "1.0";
          normal_window_opacity = "1.0";
          split_ratio = "0.50";
          auto_balance = "on";
          mouse_modifier = "fn";
          mouse_action1 = "move";
          mouse_action2 = "resize";
          layout = "bsp";
          top_padding = 10;
          bottom_padding = 10;
          left_padding = 10;
          right_padding = 10;
          window_gap = 10;
        }
        // optionalAttrs simpleBarEnabled {
          external_bar = "all:24:0";
        }
        // cfg.config;
      extraConfig =
        ''
          ${optionalString simpleBarEnabled "osascript -e 'tell application id \"tracesOf.Uebersicht\" to refresh'"}

          yabai -m space 1 --label "I"
          yabai -m space 2 --label "II"
          yabai -m space 3 --label "III"
          yabai -m space 4 --label "IV"
          yabai -m space 5 --label "V"
          yabai -m space 6 --label "VI"
          yabai -m space 7 --label "VII"
          yabai -m space 8 --label "VIII"
          yabai -m space 9 --label "IX"
          yabai -m space 10 --label "X"

          yabai -m rule --add app="^kitty$" space=10 manage=on
          yabai -m rule --add app="^Ghostty$" space=10 manage=on
          yabai -m rule --add app="^Ghostty$" title="floating-terminal" manage=off
          yabai -m rule --add app="^firefox$" space=9 manage=on
          yabai -m rule --add app="^Zen$" space=9 manage=on
          yabai -m rule --add app="^firefox$" title=".*picture-in-picture.*" manage=off
          yabai -m rule --add app="^Zen$" title=".*picture-in-picture.*" manage=off
          yabai -m rule --add app="^Safari$" title=".*picture-in-picture.*" manage=off
          yabai -m rule --add app="^Google Chrome$" title=".*picture-in-picture.*" manage=off
          yabai -m rule --add app="^Finder$" space=4 manage=on
          yabai -m rule --add app="^Marta$" space=4 manage=on
          yabai -m rule --add app="^QSpace Pro$" space=4 manage=on
          yabai -m rule --add app="^Code$" space=2 manage=on
          yabai -m rule --add app="^Google Chrome$" space=1 manage=on
        ''
        + cfg.extraConfig;
    };
  };
}

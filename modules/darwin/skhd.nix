{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.core.skhd;
in {
  options.core.skhd = {
    enable =
      mkEnableOption "skhd hotkey daemon"
      // {
        default = true;
      };
    config = mkOption {
      type = types.lines;
      default = "";
      description = "skhd configuration";
    };
  };

  config = mkIf cfg.enable {
    services.skhd = {
      enable = true;
      skhdConfig =
        ''
          # Focus window in direction (crossing monitor boundaries)
          cmd - h : yabai -m window --focus west
          cmd - j : yabai -m window --focus south
          cmd - k : yabai -m window --focus north
          cmd - l : yabai -m window --focus east

          # Arrow keys as alternative
          cmd - left : yabai -m window --focus west
          cmd - down : yabai -m window --focus south
          cmd - up : yabai -m window --focus north
          cmd - right : yabai -m window --focus east

          # Move window in direction
          cmd + shift - h : yabai -m window --swap west
          cmd + shift - j : yabai -m window --swap south
          cmd + shift - k : yabai -m window --swap north
          cmd + shift - l : yabai -m window --swap east

          # Arrow keys as alternative
          cmd + shift - left : yabai -m window --swap west
          cmd + shift - down : yabai -m window --swap south
          cmd + shift - up : yabai -m window --swap north
          cmd + shift - right : yabai -m window --swap east

          # Workspace switching (Cmd + Number) - auto focus first window on space
          cmd - 1 : yabai -m space --focus 1 && sleep 0.1 && yabai -m window --focus $(yabai -m query --windows --space | jq -r '.[0].id')
          cmd - 2 : yabai -m space --focus 2 && sleep 0.1 && yabai -m window --focus $(yabai -m query --windows --space | jq -r '.[0].id')
          cmd - 3 : yabai -m space --focus 3 && sleep 0.1 && yabai -m window --focus $(yabai -m query --windows --space | jq -r '.[0].id')
          cmd - 4 : yabai -m space --focus 4 && sleep 0.1 && yabai -m window --focus $(yabai -m query --windows --space | jq -r '.[0].id')
          cmd - 5 : yabai -m space --focus 5 && sleep 0.1 && yabai -m window --focus $(yabai -m query --windows --space | jq -r '.[0].id')
          cmd - 6 : yabai -m space --focus 6 && sleep 0.1 && yabai -m window --focus $(yabai -m query --windows --space | jq -r '.[0].id')
          cmd - 7 : yabai -m space --focus 7 && sleep 0.1 && yabai -m window --focus $(yabai -m query --windows --space | jq -r '.[0].id')
          cmd - 8 : yabai -m space --focus 8 && sleep 0.1 && yabai -m window --focus $(yabai -m query --windows --space | jq -r '.[0].id')
          cmd - 9 : yabai -m space --focus 9 && sleep 0.1 && yabai -m window --focus $(yabai -m query --windows --space | jq -r '.[0].id')
          cmd - 0 : yabai -m space --focus 10 && sleep 0.1 && yabai -m window --focus $(yabai -m query --windows --space | jq -r '.[0].id')

          # Move window to workspace
          cmd + shift - 1 : yabai -m window --space 1
          cmd + shift - 2 : yabai -m window --space 2
          cmd + shift - 3 : yabai -m window --space 3
          cmd + shift - 4 : yabai -m window --space 4
          cmd + shift - 5 : yabai -m window --space 5
          cmd + shift - 6 : yabai -m window --space 6
          cmd + shift - 7 : yabai -m window --space 7
          cmd + shift - 8 : yabai -m window --space 8
          cmd + shift - 9 : yabai -m window --space 9
          cmd + shift - 0 : yabai -m window --space 10

          # Application launchers
          cmd - return : open -n "/Users/rodeyseijkens/Applications/Home Manager Trampolines/Ghostty.app"
          cmd + shift - return : open -n "/Users/rodeyseijkens/Applications/Home Manager Trampolines/Ghostty.app"
          cmd - e : open -n "/Applications/QSpace Pro.app"
          cmd - b : google-chrome --profile-directory="Default" --new-window
          cmd + shift - b : open -n "/Users/${vars.username}/Applications/Home Manager Apps/Zen Browser (Beta).app"

          # Close window
          cmd - q : yabai -m window --close

          # Disable cmd-alt-h (hide others)
          #cmd + alt - h : :

          # Service mode - enter with alt + ;
          #alt - semicolon : skhd -m "service"

          # Service mode: layout commands
          #<service> t : yabai -m layout --tiles
          #<service> a : yabai -m layout --bsp
          #<service> f : yabai -m window --toggle float

          # Service mode: resize
          #<service> - : yabai -m window --resize top:0:-50 && yabai -m window --resize bottom:0:-50
          #<service> = : yabai -m window --resize top:0:50 && yabai -m window --resize bottom:0:50

          # Service mode: close all but current
          #<service> backspace : yabai -m query --windows | jq -r '.[] | select(.id != env.YABAI_WINDOW_ID) | .id' | xargs -I{} yabai -m window {} --close
        ''
        + cfg.config;
    };
  };
}

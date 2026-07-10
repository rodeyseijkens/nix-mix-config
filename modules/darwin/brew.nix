{...}: {
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "uninstall";
    };

    brews = [
      "yabai"
      "skhd"
      "lua"
      "ni"
      "ripgrep"
    ];

    taps = [
      {
        name = "asmvik/formulae";
        trusted = true;
      }
      {
        name = "nikitabobko/tap";
        trusted = true;
      }
      {
        name = "felixkratz/formulae";
        trusted = true;
      }
      {
        name = "manefunction/tap";
        trusted = true;
      }
    ];

    casks = [
      {
        name = "zed";
        greedy = true;
      }
      {
        name = "xcodes-app";
        greedy = true;
      }
      {
        name = "sf-symbols";
        greedy = true;
      }
      {
        name = "font-sf-pro";
        greedy = true;
      }
      {
        name = "font-sf-mono";
        greedy = true;
      }
      {
        name = "font-space-mono-nerd-font";
        greedy = true;
      }
      {
        name = "wifiman";
        greedy = true;
      }
      {
        name = "legcord";
        greedy = true;
      }
      {
        name = "shottr";
        greedy = true;
      }
      {
        name = "raspberry-pi-imager";
        greedy = true;
      }
      {
        name = "hiddenbar";
        greedy = true;
      }
      {
        name = "notchnook";
        greedy = true;
      }
      {
        name = "pearcleaner";
        greedy = true;
      }
      {
        name = "kap";
        greedy = true;
      }
      {
        name = "the-unarchiver";
        greedy = true;
      }
      {
        name = "qspace-pro";
        greedy = true;
      }
      {
        name = "marta";
        greedy = true;
      }
      {
        name = "postman";
        greedy = true;
      }
      {
        name = "tigervnc";
        greedy = true;
      }
      {
        name = "beekeeper-studio";
        greedy = true;
      }
      {
        name = "moonlight";
        greedy = true;
      }
    ];

    masApps = {
      "Keynote" = 409183694;
      "Numbers" = 409203825;
      "Pages" = 409201541;
      "Tailscale" = 1475387142;
      "ProtonPassForSafari" = 6502835663;
      "wireguard" = 1451685025;
    };
  };
}

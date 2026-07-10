{
  lib,
  config,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.simple-bar;
  yabaiBin = "/opt/homebrew/bin/yabai";
  simpleBarSrc = pkgs.fetchFromGitHub {
    owner = "Jean-Tinland";
    repo = "simple-bar";
    rev = "fb5cada548a05bd01f727772c0a18fd8c7f65b42";
    hash = "sha256-AoVNnaTXCso6dWnv8kwvu+AMHEYU3znnpDk88UjkT/M=";
  };
  simpleBarConfig = {
    "$schema" = "https://raw.githubusercontent.com/Jean-Tinland/simple-bar/refs/heads/master/lib/schemas/config.json";
    global = {
      theme = "dark";
      compactMode = false;
      floatingBar = false;
      noBarBg = false;
      noColorInData = false;
      bottomBar = false;
      sideDecoration = false;
      inlineSpacesOptions = false;
      spacesBackgroundColorAsForeground = true;
      widgetsBackgroundColorAsForeground = true;
      widgetMaxWidth = "160px";
      slidingAnimationPace = 4;
      disableAnimations = false;
      font = "Maple Mono NF CN, JetBrains Mono, Monaco, Menlo, monospace";
      fontSize = "12px";
      yabaiPath = yabaiBin;
      aerospacePath = "/opt/homebrew/bin/aerospace";
      windowManager = "yabai";
      shell = "sh";
      terminal = "Ghostty";
      disableNotifications = false;
      enableMissives = false;
      enableServer = false;
      serverSocketPort = 7777;
      yabaiServerRefresh = false;
      aerospaceServerRefresh = false;
    };
    themes = {
      lightTheme = "GruvboxLight";
      darkTheme = "GruvboxMaterial";
      colorMain = "#3C3836";
      colorMainAlt = "#7C6F64";
      colorMinor = "#504945";
      colorAccent = "#D65D0E";
      colorRed = "#CC241D";
      colorGreen = "#689D6A";
      colorYellow = "#D79921";
      colorOrange = "#D65D0E";
      colorBlue = "#458588";
      colorMagenta = "#B16286";
      colorCyan = "#689D6A";
      colorBlack = "#282828";
      colorWhite = "#FBF1C7";
      colorForeground = "#FBF1C7";
      colorBackground = "#3C3836";
    };
    process = {
      showOnDisplay = "";
      displayOnlyCurrent = false;
      centered = false;
      showCurrentSpaceMode = false;
      hideWindowTitle = false;
      displayOnlyIcon = false;
      expandAllProcesses = false;
      displaySkhdMode = false;
      displayStackIndex = true;
      displayOnlyCurrentStack = false;
      displayForFocusedSpace = false;
    };
    spacesDisplay = {
      showOnDisplay = "";
      exclusions = "";
      titleExclusions = "";
      spacesExclusions = "";
      exclusionsAsRegex = false;
      displayAllSpacesOnAllScreens = false;
      hideDuplicateAppsInSpaces = false;
      displayStickyWindowsSeparately = false;
      hideCreateSpaceButton = false;
      hideEmptySpaces = false;
      showOptionsOnHover = true;
      switchSpacesWithoutYabai = false;
    };
    widgets = {
      processWidget = true;
      weatherWidget = false;
      netstatsWidget = false;
      cpuWidget = false;
      gpuWidget = false;
      memoryWidget = false;
      batteryWidget = true;
      wifiWidget = true;
      vpnWidget = false;
      zoomWidget = false;
      soundWidget = true;
      micWidget = false;
      dateWidget = true;
      timeWidget = true;
      keyboardWidget = false;
      spotifyWidget = false;
      cryptoWidget = false;
      stockWidget = false;
      youtubeMusicWidget = false;
      musicWidget = false;
      mpdWidget = false;
      browserTrackWidget = false;
      githubWidget = false;
      notificationsWidget = false;
      nextMeetingWidget = false;
    };
    batteryWidgetOptions = {
      refreshFrequency = 10000;
      showOnDisplay = "";
      showIcon = true;
      toggleCaffeinateOnClick = true;
      caffeinateOption = "";
    };
    networkWidgetOptions = {
      refreshFrequency = 20000;
      showOnDisplay = "";
      showIcon = true;
      networkDevice = "en0";
      hideWifiIfDisabled = false;
      toggleWifiOnClick = false;
      hideNetworkName = false;
    };
    soundWidgetOptions = {
      refreshFrequency = 20000;
      showOnDisplay = "";
      showIcon = true;
    };
    dateWidgetOptions = {
      refreshFrequency = 30000;
      showOnDisplay = "";
      showIcon = true;
      shortDateFormat = true;
      locale = "en-UK";
      calendarApp = "";
    };
    timeWidgetOptions = {
      refreshFrequency = 1000;
      showOnDisplay = "";
      showIcon = true;
      hour12 = false;
      dayProgress = false;
      showSeconds = false;
    };
    customStyles = {
      styles = ''
        :root {
          --main: #3C3836;
          --main-alt: #7C6F64;
          --minor: transparent;
          --accent: #D65D0E;
          --red: #CC241D;
          --green: #689D6A;
          --yellow: #D79921;
          --orange: #D65D0E;
          --blue: #458588;
          --magenta: #B16286;
          --cyan: #78c4d4;
          --black: #282828;
          --white: #FBF1C7;
          --foreground: #FBF1C7;
          --background: #3C3836;
          --font: "Maple Mono NF CN", "JetBrains Mono", Monaco, Menlo, monospace;
          --font-size: 12px;
          --bar-height: 38px;
          --bar-radius: 0px;
          --bar-border: 0px solid transparent;
          --bar-inner-margin: 0px 12px;
          --item-radius: 0px;
          --item-inner-margin: 0px 8px;
          --item-outer-margin: 0 0 0 10px;
          --light-shadow: none;
          --hover-ring: none;
          --focus-ring: none;
        }

        .simple-bar {
          background-color: #3C3836;
          box-shadow: none;
          border-bottom: 1px solid rgba(251, 241, 199, 0.08);
        }

        .spaces,
        .process__container,
        .simple-bar__data,
        .space__inner,
        .process__window,
        .data-widget {
          background: transparent;
          box-shadow: none;
        }

        .space--focused .space__inner,
        .simple-bar--spaces-background-color-as-foreground .space--focused .space__inner,
        .simple-bar--spaces-background-color-as-foreground .space--focused .space__label {
          color: #D65D0E;
        }

        .space--visible .space__inner {
          color: #FBF1C7;
        }

        .battery,
        .wifi,
        .sound,
        .date-display,
        .time {
          color: #FBF1C7;
        }

        .battery svg {
          color: #689D6A;
        }

        .time,
        .date-display {
          letter-spacing: 0.01em;
        }
      '';
    };
  };
in {
  options.modules.simple-bar = {
    enable = mkEnableOption "simple-bar";
  };

  config = mkIf cfg.enable {
    home.file."Library/Application Support/Übersicht/widgets/simple-bar".source = simpleBarSrc;

    home.file.".simplebarrc".text = builtins.toJSON simpleBarConfig;

    home.activation.ensureUbersichtWidgetsDir = lib.hm.dag.entryBefore ["writeBoundary"] ''
      $DRY_RUN_CMD mkdir -p "$HOME/Library/Application Support/Übersicht/widgets"
    '';
  };
}

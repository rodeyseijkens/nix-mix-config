{
  lib,
  config,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.ubersicht;
  ubersicht = pkgs.stdenvNoCC.mkDerivation {
    pname = "ubersicht";
    version = "1.6.82";

    src = pkgs.fetchurl {
      url = "https://tracesof.net/uebersicht/releases/Uebersicht-1.6.82.app.zip";
      hash = "sha256-OdteCr8D9jkJklEclGwZuXqJ+E6+KshyGev5If/7lys=";
    };

    nativeBuildInputs = [
      pkgs.unzip
    ];

    sourceRoot = ".";

    unpackPhase = ''
      unzip "$src"
    '';

    installPhase = ''
      runHook preInstall

      mkdir -p "$out/Applications"
      cp -R "Übersicht.app" "$out/Applications/Übersicht.app"

      runHook postInstall
    '';
  };
in {
  options.modules.ubersicht = {
    enable = mkEnableOption "Übersicht";
  };

  config = mkIf cfg.enable {
    home.packages = [
      ubersicht
    ];
  };
}

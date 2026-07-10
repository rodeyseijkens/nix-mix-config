{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    curl # download utility
    entr # run arbitrary commands when files change
    eza # ls replacement
    fd # find replacement
    ffmpeg # multimedia framework
    file # Show file information
    gnupg # gpg
    lazygit # terminal git UI
    ncdu # disk space
    nix-prefetch-github
    openssl # ssl
    ripgrep # grep replacement
    unzip # unzip utility
    wget # download utility
    xdg-utils # xdg utilities
    xz # xz compression
    yazi # terminal file manager
    yt-dlp-light # audio/video downloader
    imagemagick # image manipulation
    viu # terminal image viewer
    jq # JSON processor
    onefetch # git repository information

    # Node.js
    volta

    # Python
    python3
    python312Packages.ipython

    # Language servers and formatters
    inputs.alejandra.defaultPackage.${pkgs.stdenv.hostPlatform.system}
  ];
}

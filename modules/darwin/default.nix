{
  system = import ./system.nix;
  macos = import ./macos.nix;
  pkgs = import ./pkgs.nix;
  brew = import ./brew.nix;
  yabai = import ./yabai.nix;
  skhd = import ./skhd.nix;
  spacebar = import ./spacebar.nix;
  simple-bar = import ./simple-bar.nix;
}

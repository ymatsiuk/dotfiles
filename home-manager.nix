{ pkgs, ... }:

{
  imports = [
    <home-manager/nixos>
  ];

  home-manager.useGlobalPkgs = true;
  home-manager.users.ymatsiuk = { pkgs, ... }: {
    imports = [
      ./home/alacritty.nix
      ./home/dunst.nix
      ./home/git.nix
      ./home/gtk.nix
      ./home/i3status-rust.nix
      ./home/redshift.nix
      # rofi migration in progress
      # ./home/rofi.nix
      ./home/starship.nix
      ./home/zsh.nix
      ./modules/git.nix
      ./modules/i3status-rust.nix
    ];
    home.packages = with pkgs ; [
      autocutsel #sync clipboard
      go
      google-chrome
      gsimplecal iw #i3status-rust deps
      lastpass-cli
      libnotify
      libsecret
      light
      patchelf
      ripgrep
      scrot
      slack
    ];

    programs.fzf.enable = true;
    programs.gpg.enable = true;
    programs.htop.enable = true;
    services.network-manager-applet.enable = true;
    services.pasystray.enable = true;
  };
}
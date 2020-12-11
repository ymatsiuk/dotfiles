# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      ./bluetooth.nix
      ./compton.nix
      ./docker.nix
      ./fonts.nix
      ./hardware-configuration.nix
      ./opengl.nix
      ./pulseaudio.nix
      ./users.nix
    ];
  nixpkgs.config.allowUnfree = true;

  networking = {
    hostName = "xps";
    interfaces.wlp2s0.useDHCP = true;
    networkmanager.enable = true;
    useDHCP = false;
  };

  time.timeZone = "Europe/Amsterdam";
  i18n.defaultLocale = "en_US.UTF-8";
  sound.enable = true;
  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };
  environment.shells = [ pkgs.zsh ];
  environment.variables = {
    EDITOR = "nvim";
    GDK_SCALE = "2";
    GDK_DPI_SCALE = "0.5";
    _JAVA_OPTIONS = "-Dsun.java2d.uiScale=2";
  };
  environment.systemPackages = with pkgs; [
    wget neovim firefox alacritty bat git htop tree starship zsh dunst
    xorg.xbacklight xorg.xcursorthemes starship
    slack lastpass-cli lxappearance bluejeans-gui
    acpi feh networkmanagerapplet libsecret
  ];

  environment.pathsToLink = [ "/libexec" ];
  services.fwupd.enable = true;
  services.xserver = {
    enable = true;
    dpi = 220;
    videoDrivers = [ "modesetting" ];

    libinput = {
      enable = true;
      disableWhileTyping = true;
      naturalScrolling = true;
    };

    desktopManager = {
      xterm.enable = false;
    };
   
    displayManager = {
      defaultSession = "none+i3";
      lightdm.greeters.gtk.cursorTheme = {
        name = "Vanilla-DMZ";
	package = pkgs.vanilla-dmz;
	size = 64;
      };
    };

    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
      extraPackages = with pkgs; [
        dmenu
        i3status
        i3lock-fancy-rapid
        i3blocks-gaps
     ];
    };
  };

  system.stateVersion = "20.09";
}


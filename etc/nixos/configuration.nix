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
      ./neovim.nix
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

  environment = {
    shells = [ pkgs.zsh ];
    variables = {
      GDK_SCALE = "2";
      GDK_DPI_SCALE = "0.5";
      _JAVA_OPTIONS = "-Dsun.java2d.uiScale=2";
    };
    pathsToLink = [ "/libexec" ];
    systemPackages = with pkgs; [
      acpi
      alacritty
      bluejeans-gui
      feh
      firefox
      git
      htop
      lastpass-cli
      libsecret
      lxappearance
      networkmanagerapplet
      slack
      starship
      tree
      zsh
    ];
  };

  services.fwupd.enable = true;
  services.xserver = {
    enable = true;
    dpi = 220;
    videoDrivers = [ "modesetting" ];

    libinput = {
      enable = true;
      disableWhileTyping = true;
      naturalScrolling = true;
      accelSpeed = "0.5";
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


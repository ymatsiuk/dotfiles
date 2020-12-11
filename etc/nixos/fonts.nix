{ config, pkgs, ... }:
{
  fonts = {
    fontconfig = {
      enable = true;
      antialias = true;
      #subpixel.lcdfilter = "none";
      #subpixel.rgba = "rgb";
      #hinting.enable = true;
      #hinting.autohint = false;
    };
    enableDefaultFonts = true;
    enableFontDir = true;
    fonts = [
      pkgs.corefonts
      pkgs.fira-code
      pkgs.font-awesome_4
      pkgs.inconsolata
      pkgs.iosevka
      pkgs.powerline-fonts
      pkgs.roboto
      pkgs.source-code-pro
      pkgs.terminus_font
      pkgs.ubuntu_font_family
    ];
  };
}

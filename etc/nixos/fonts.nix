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
    fonts = with pkgs; [
      corefonts
      fira-code
      font-awesome_4
      inconsolata
      iosevka
      powerline-fonts
      roboto
      source-code-pro
      terminus_font
      ubuntu_font_family
    ];
  };
}

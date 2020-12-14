{ config, ... }:
{
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    ohMyZsh = {
      theme = "agnoster";
      enable = true;
      plugins = [ "git" "vi-mode" "docker" ];
    };
  };
}

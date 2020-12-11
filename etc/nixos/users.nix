{ config, pkgs, ... }:

{
  security.sudo.wheelNeedsPassword = false;
  users = {
    users = {
      ymatsiuk = {
        description = "Yurii Matsiuk";
        extraGroups = [ "ymatsiuk" "wheel" "audio" "video" "networkmanager" "docker" ];
        home = "/home/ymatsiuk";
        isNormalUser = true;
        shell = pkgs.zsh; 
        uid = 1000;
      };
    };
    groups = {
      ymatsiuk = {
        gid = 1000;
        members = [ "ymatsiuk" ];
      };
    };
  };
}


{ config, pkgs, ... }:

{
  imports = [
    ../git
    ../zsh    
  ];

  home = {
    stateVersion = "25.05";

    packages = with pkgs; [];

    sessionVariables = {
      SSH_AUTH_SOCK = "${config.home.homeDirectory}/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock";
    };
  };

  programs = {
    home-manager.enable = true;
    git = {
      userEmail = "ihor.hritskiv@macpaw.com";
      extraConfig = {
        user = {
          signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMDJsdTu338Zym5UB9s79/UQB08xoNcSK13igp0iVrUW";
        };
      };
    };
  };
}

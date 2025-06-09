{ config, pkgs, ... }:

{
  imports = [
    ../../home   
  ];

  home = {
    stateVersion = "25.05";

    packages = with pkgs; [
      bitwarden
      rbw
    ];

    sessionVariables = {
      SSH_AUTH_SOCK = "${config.home.homeDirectory}/.bitwarden-ssh-agent.sock";
    };
  };

  programs = {
    home-manager.enable = true;
    git = {
      userEmail = "ihor.hritskiv@gmail.com";
      extraConfig = {
        user = {
          signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIM+2FKH7Ble7BEaIKvXRzwjvtoP1zMpz30WBUjHTzrvI ihor.hritskiv@gmail.com";
        };
      };
    };
  };
}

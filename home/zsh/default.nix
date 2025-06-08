{ pkgs, ... }:

{
  home.sessionVariables = {
    SHELL = "${pkgs.zsh}/bin/zsh";
  };

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "rbw"
        "sudo"
        "kubectl"
      ];
    };
  };
}

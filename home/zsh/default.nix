{ pkgs, ... }:

{
  home = {
    sessionVariables = {
      SHELL = "${pkgs.zsh}/bin/zsh";
    };
    packages = with pkgs; [
      zsh-powerlevel10k
      meslo-lgs-nf
    ];
  };

  home.file.".p10k.zsh".source = ./.p10k.zsh;

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      custom = (pkgs.runCommand "p10k-custom-theme" {} ''
        mkdir -p $out/themes/powerlevel10k
        cp -r ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/* $out/themes/powerlevel10k
      '').outPath;
      theme = "powerlevel10k/powerlevel10k";
      plugins = [
        "rbw"
        "sudo"
        "kubectl"
      ];
    };
  };
}

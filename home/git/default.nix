{ pkgs, ... }:

{
  programs = {
    gh = {
      enable = true;

      settings = {
        git_protocol = "ssh";
        prompt = "enabled";
      };
    };

    git = {
      enable = true;

      userName = "Ihor Hrytskiv";

      extraConfig = {
        core = {
          editor = "vim";
        };
        init = {
          defaultBranch = "main";
        };
        gpg = {
          format = "ssh";
        };
        commit = {
          gpgSign = true;
        };
      };
    };
  };
}

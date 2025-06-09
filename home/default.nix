{ config, pkgs, ... }:

{
  imports = [
    ./zsh
    ./git
    ./nvim
  ];
}

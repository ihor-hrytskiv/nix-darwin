{
  description = "My configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-25.05-darwin";
    nix-darwin = {
      url = "github:LnL7/nix-darwin/nix-darwin-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager }:
  let
    user = "ihor.hrytskiv";

    configuration = { pkgs, ... }: {
      environment.systemPackages = [];

      nix.settings.experimental-features = "nix-command flakes";

      system.configurationRevision = self.rev or self.dirtyRev or null;

      system.stateVersion = 5;

      nixpkgs = {
        hostPlatform = "aarch64-darwin";
      };
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#MacBook-Air-Ihor.local
    darwinConfigurations = {
      MacBook-Air-Ihor = nix-darwin.lib.darwinSystem {
        modules = [
          home-manager.darwinModules.home-manager 
          {
            users.users."${user}" = {
              name = "${user}";
              home = "/Users/${user}";
            };

            home-manager.users."${user}" = {
              imports = [
                ./home/personal-mac
              ];
              # nixpkgs.config.allowUnfree = true;
            };
          }
          configuration
        ];
      };
    };
  };
}

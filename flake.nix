{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

    #home-manager = {
    #  url = "github:nix-community/home-manager/release-24.05";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};

    nix-on-droid = {
      url = "github:nix-community/nix-on-droid/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      #home-manager,
      nix-on-droid,
    }:
    {
      nixOnDroidConfigurations.default = nix-on-droid.lib.nixOnDroidConfiguration {
        pkgs = import nixpkgs { system = "aarch64-linux"; };
        modules = [
          #home-manager.nixosModules.home-manager
          ./sshd.nix
          ./stuff.nix
        ];
      };

      formatter = {
        x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;
        aarch64-linux = nixpkgs.legacyPackages.aarch64-linux.nixfmt-rfc-style;
      };
    };
}
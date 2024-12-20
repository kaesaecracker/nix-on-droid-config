{ config, pkgs, ... }:
{
  home-manager = {
    backupFileExtension = "hm-bak";
    useGlobalPkgs = true;

    config =
      {
        config,
        lib,
        pkgs,
        ...
      }:
      {
        # Read the changelog before changing this value
        home.stateVersion = "24.05";

        # insert home-manager config
      };
  };
}

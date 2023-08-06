{ pkgs, user, ... }:

{
  imports = [ 
    ./hardware-configuration.nix
#    ../../modules/fonts 
  ];
  
  boot = {
    kernelPackages = pkgs.linuxPackages_xanmod_latest;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = 1;
    };
    kernelParams = [
      "quiet"
      "splash"
    ];
  };
  
  users = {
    mutableUsers = false;
    users = {
      root.initialHashedPassword = "$6$BFqavWl3XGR/osa2$m.on6Pmf6NnMKmqkgEPU/tBbtIppprkJKYN1V.EIFeIxv3Gfev4hiKJrRhYxQNHKV9UKijVTiWdrpGZHVs/Zi0";
      ${user} = {
        initialHashedPassword = "$6$0t7iYuJM9ZY8FA6x$jzDlKNw2JRsAa3YVS//cnyRsB48tpiAECNT6Nx1SKZJi3DH3.O2WBZ7yD1KgtY5iSyK8ds.8X9NYj.sAHLd6x/";
        isNormalUser = true;
        extraGroups = [ "wheel" ];
        packages = with pkgs; [  ];
      };
    };
  };
}

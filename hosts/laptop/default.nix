{ pkgs, user, ... }:

{
  nixpkgs.config.allowUnfree = true;
   
  imports = [ 
    ./hardware-configuration.nix
    ../../modules/fonts
    ../../modules/desktop/hyprland
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
      root.initialHashedPassword = "$6$BEhxUlUqxzY4xzY4$s.ipnI8yNpZT7zsyvCXUElqkUC8rHMeN9B4VA6KfEvSVpePy2lwjmD29lGuD40xOlxFrGDaiClpdEyokkMBVS/";
      ${user} = {
        initialHashedPassword = "$6$ESdav.WnmfjXxVS4$XfW.D9nEjUgayzNwk5V/GbQsMUPPdTX5JX6KUYbCrEx4vM3dQtOaaWaOILO1roGXlcjPqfgepbxP1InVGbve11";
        isNormalUser = true;
        extraGroups = [ "wheel" "video" "audio" ];
        packages = with pkgs; [  ];
      };
    };
  };

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-rime
    ];
  };

  environment = {
    systemPackages = with pkgs; [
      bibata-cursors
      clash-verge
      joshuto
    ];
  };

  security.polkit.enable = true;
}

{ pkgs, inputs, ... }:

{
  imports = [ ../../programs/waybar/hyprland_waybar.nix ];
  programs = {
    hyprland.enable = true;
    dconf.enable = true;
    light.enable = true;
  };

  environment.systemPackages = with pkgs; [
    inputs.hypr-contrib.packages.${pkgs.system}.grimblast
    inputs.hyprpicker.packages.${pkgs.system}.hyprpicker
    swaylock-effects
    pamixer
  ];

  security.pam.services.swaylock = { };
  xdg.portal = {
    enable = true;
    wlr.enable = false;
  };

}

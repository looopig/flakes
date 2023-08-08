{ config, lib, pkgs, user, ... }:

{
  imports = 
    ( import ../../modules/shell ) ++
    ( import ../../modules/programs ) ++
    [( import ../../modules/desktop/hyprland/home.nix )];
  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";
    pointerCursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 32;
    };
  };
  
  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

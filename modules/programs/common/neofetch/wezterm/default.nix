{ config, pkgs, ... }:

{
  programs = {
    wezterm = {
      enable = true;
      environment = { };
      keybindings = { };
    };
  };
}

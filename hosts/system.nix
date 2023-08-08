{ pkgs, user, host, ... }:

{
  nixpkgs.system = "x86_64-linux";

  networking = {
    hostName = "${host}"; # Define your hostname.
    hosts = {
      "202.89.233.100" = [ "cn.bing.com" ];
      "104.21.55.199"  = [ "doget-api.oopscloud.xyz" ];
    };
  };
  
  time.timeZone = "Asia/Shanghai";

  i18n.defaultLocale = "en_US.UTF-8";

  environment = {
    variables = { EDITOR = "nvim"; VISUAL = "nvim"; };
    defaultPackages = [ pkgs.neovim pkgs.nano ];
    systemPackages = with pkgs; [
      git
      wget
      unzip
    ];
  };
  
  services = {
    openssh.enable = true;
  };

  security = {
    sudo.enable = false;
    doas = {
      enable = true;
      extraConfig = '' '';
    };
  };
  
  programs.proxychains = {
    enable = true;
    proxies = {
      "${user}-proxy" = {
        enable = true;
        type = "socks4";
        host = "192.168.1.5";
        port = 7890;
      };
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}

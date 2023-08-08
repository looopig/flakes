{ config ,lib, pkgs, ... }:

with pkgs; let
  patchDesktop = pkg: appName: from: to: (lib.hiPrio (pkgs.runCommand "$patched-desktop-entry-for-${appName}" {} ''
    ${coreutils}/bin/mkdir -p $out/share/applications
    ${gnused}/bin/sed 's#${from}#${to}#g' < ${pkg}/share/applications/${appName}.desktop > $out/share/applications/${appName}.desktop
  ''));
in {
  home.packages = [
    obsidian
    (patchDesktop obsidian "obsidian" "^Exec=obsidian %u" "Exec=obsidian --enable-features=UseOzonePlatform --ozone-platform=wayland --enable-wayland-ime %u")
  ];
}

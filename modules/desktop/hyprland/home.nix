{ ... }:
{
  imports = [
    (import ../../environment/hypr-variables.nix)
  ];

  programs = {
    bash = {
      initExtra = ''
        if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
           exec dbus-run-session Hyprland
        fi
      '';
    };
  };

  systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig =''
      # This is an example Hyprland config file.
      #
      # Refer to the wiki for more information.
      
      #
      # Please note not all available settings / options are set here.
      # For a full list, see the wiki
      #
      
      # See https://wiki.hyprland.org/Configuring/Monitors/
      monitor=,preferred,auto,1
      
      
      # See https://wiki.hyprland.org/Configuring/Keywords/ for more
      
      # Execute your favorite apps at launch
      # exec-once = waybar & hyprpaper & firefox
      exec-once = dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
      
      # Source a file (multi-file configs)
      # source = ~/.config/hypr/myColors.conf
      
      # For all categories, see https://wiki.hyprland.org/Configuring/Variables/
      input {
        kb_layout = us
        kb_variant =
        kb_model =
        kb_options =
        kb_rules =
      
        follow_mouse = 1
      
        touchpad {
            natural_scroll = false
        }
      
        sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
      }
      
      general {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more
      
        gaps_in = 3
        gaps_out = 5
        border_size = 3
        col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
        col.inactive_border = rgba(595959aa)
      
        layout = dwindle
      }
      
      decoration {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more
      
        rounding = 0
      
        blur {
            enabled = true
            size = 3
            passes = 1
        }
      
        drop_shadow = true
        shadow_range = 4
        shadow_render_power = 3
        col.shadow = rgba(1a1a1aee)
      }
      
      animations {
        enabled = true
      
        # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
      
        bezier = myBezier, 1, 1, 1, 1
      
        animation = windows, 1, 3, myBezier, popin
        animation = windowsIn, 1, 3, myBezier, popin
        animation = windowsOut, 1, 3, myBezier, popin 80%
        animation = windowsMove, 1, 3, default, popin
        animation = border, 1, 1, myBezier
        animation = borderangle, 1, 50, myBezier, loop
        animation = fade, 1, 7, myBezier
        animation = workspaces, 1, 3, myBezier, slide
      }
      
      dwindle {
        # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
        pseudotile = true # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = true # you probably want this
      }
      
      master {
        # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
        new_is_master = true
      }
      
      gestures {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more
        workspace_swipe = false
      }
      
      # Example per-device config
      # See https://wiki.hyprland.org/Configuring/Keywords/#per-device-input-configs for more
      #device:epic-mouse-v1 {
      #    sensitivity = -0.5
      #}
      
      # Example windowrule v1
      # windowrule = float, ^(kitty)$
      # Example windowrule v2
      # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
      # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
      
      
      # See https://wiki.hyprland.org/Configuring/Keywords/ for more
      $mainMod = ALT
      
      # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
      # -------------------------------------------------------------------------------------
      # ------------ #
      # Basic System #
      # ------------ #
      bind = $mainMod	SHIFT,	Return,	exec,	wezterm
      bind = $mainMod	, 	P,	exec,	rofi -show drun
      bind = $mainMod	, 	tab,	exec,	rofi -show window
      bind = $mainMod	SHIFT,	C,		killactive,
      bind = $mainMod, M, exit,
      bind = $mainMod, E, exec, dolphin
      bind = $mainMod, V, togglefloating,
      bind = $mainMod, P, pseudo, # dwindle
      bind = $mainMod, 1, togglesplit, # dwindle
      
      # Move focus with mainMod + arrow keys
      bind = $mainMod	,	left,		movefocus,	l
      bind = $mainMod	,	right,		movefocus,	r
      bind = $mainMod	,	up,		movefocus,	u
      bind = $mainMod	,	down,		movefocus,	d
      bind = $mainMod	,	H,		movefocus,	l
      bind = $mainMod	,	L,		movefocus,	r
      bind = $mainMod	,	K,		movefocus,	u
      bind = $mainMod	,	J,		movefocus,	d

      # move window in current workspace
      bind = $mainMod	SHIFT,	left,		movewindow,	l
      bind = $mainMod	SHIFT,	right,		movewindow,	r
      bind = $mainMod	SHIFT,	up,		movewindow,	u
      bind = $mainMod	SHIFT,	down,		movewindow,	d
      bind = $mainMod	SHIFT,	H,		movewindow,	l
      bind = $mainMod	SHIFT,	L,		movewindow,	r
      bind = $mainMod	SHIFT,	K,		movewindow,	u
      bind = $mainMod	SHIFT,	J,		movewindow,	d
      
      # Switch workspaces with mainMod + [0-9]
      bind = $mainMod, 1, workspace, 1
      bind = $mainMod, 2, workspace, 2
      bind = $mainMod, 3, workspace, 3
      bind = $mainMod, 4, workspace, 4
      bind = $mainMod, 5, workspace, 5
      bind = $mainMod, 6, workspace, 6
      bind = $mainMod, 7, workspace, 7
      bind = $mainMod, 8, workspace, 8
      bind = $mainMod, 9, workspace, 9
      bind = $mainMod, 0, workspace, 10
      
      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      bind = $mainMod SHIFT, 1, movetoworkspace, 1
      bind = $mainMod SHIFT, 2, movetoworkspace, 2
      bind = $mainMod SHIFT, 3, movetoworkspace, 3
      bind = $mainMod SHIFT, 4, movetoworkspace, 4
      bind = $mainMod SHIFT, 5, movetoworkspace, 5
      bind = $mainMod SHIFT, 6, movetoworkspace, 6
      bind = $mainMod SHIFT, 7, movetoworkspace, 7
      bind = $mainMod SHIFT, 8, movetoworkspace, 8
      bind = $mainMod SHIFT, 9, movetoworkspace, 9
      bind = $mainMod SHIFT, 0, movetoworkspace, 10
      
      # Scroll through existing workspaces with mainMod + scroll
      bind = $mainMod, mouse_down, workspace, e+1
      bind = $mainMod, mouse_up, workspace, e-1
      
      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = $mainMod, mouse:272, movewindow
      bindm = $mainMod, mouse:273, resizewindow
    '';
  };
}

{ ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
      $mainMod = ALT
      
      monitor=,preferred,auto,1
      
      input {
        kb_layout = us
        kb_variant =
        kb_model =
        kb_options = caps:escape
        kb_rules =

        follow_mouse = 2 # 0|1|2|3
        float_switch_override_focus = 2
        numlock_by_default = true

        touchpad {
        natural_scroll = yes
        }

        sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
      }
      
      general {
        gaps_in = 3
        gaps_out = 5
        border_size = 3
        col.active_border = rgb(ffc0cb)
        col.inactive_border = rgba(595959aa)

        layout = dwindle # master|dwindle 
      }

      dwindle {
        no_gaps_when_only = false
        force_split = 0 
        special_scale_factor = 0.8
        split_width_multiplier = 1.0 
        use_active_for_splits = true
        pseudotile = yes 
        preserve_split = yes 
      }

      master {
        new_is_master = true
        special_scale_factor = 0.8
        new_is_master = true
        no_gaps_when_only = false
      }

      # cursor_inactive_timeout = 0
      decoration {
        multisample_edges = true
        active_opacity = 1.0
        inactive_opacity = 1.0
        fullscreen_opacity = 1.0
        rounding = 0
        blur = yes 
        blur_size = 3
        blur_passes = 1
        blur_new_optimizations = true
        blur_xray = true

        drop_shadow = false
        shadow_range = 4
        shadow_render_power = 3
        shadow_ignore_window = true
      # col.shadow = 
      # col.shadow_inactive
      # shadow_offset
        dim_inactive = false
      # dim_strength = #0.0 ~ 1.0
        blur_ignore_opacity = false
        col.shadow = rgba(1a1a1aee)
      }

      # animations {
      #   enabled = yes
      #
      #   bezier = easeOutElastic, 0.05, 0.9, 0.1, 1.05
      #   # bezier=overshot,0.05,0.9,0.1,1.1
      #
      #   animation = windows, 1, 5, easeOutElastic
      #   animation = windowsOut, 1, 5, default, popin 80%
      #   animation = border, 1, 8, default
      #   animation = fade, 1, 5, default
      #   animation = workspaces, 1, 6, default
      # }
      animations {
        enabled=1
        bezier = overshot, 0.13, 0.99, 0.29, 1.1
        animation = windows, 1, 4, overshot, slide
        animation = windowsOut, 1, 5, default, popin 80%
        animation = border, 1, 5, default
        animation = fade, 1, 8, default
        animation = workspaces, 1, 6, overshot, slidevert
      }

      gestures {
        workspace_swipe = true
        workspace_swipe_fingers = 4
        workspace_swipe_distance = 250
        workspace_swipe_invert = true
        workspace_swipe_min_speed_to_force = 15
        workspace_swipe_cancel_ratio = 0.5
        workspace_swipe_create_new = false
      }

      misc {
        disable_autoreload = true
        disable_hyprland_logo = true
        always_follow_on_dnd = true
        layers_hog_keyboard_focus = true
        animate_manual_resizes = false
        enable_swallow = true
        swallow_regex =
        focus_on_activate = true
      }

      device:epic mouse V1 {
        sensitivity = -0.5
      }
      
      bind = $mainMod SHIFT, Q, exit,
    '';
  };
}

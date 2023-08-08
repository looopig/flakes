{ pkgs, ... }:

{
  programs = {
    wezterm = {
      enable = true;
      extraConfig = ''
        local wezterm = require "wezterm"
        local font_name = "JetBrainsMono Nerd Font"

	local function font_with_fallback(name)
	  local names = { name };
          return wezterm.font_with_fallback(names)
	end

	return {
	  -- OpenGl for GPU accelerations, Sofrware for CPU
	  front_end = "OpenGL",
	  
	  color_scheme = "Catppuccin Mocha",

          font = font_with_fallback(font_name),
	  font_rules = {
	    {
	      italic = true,
	      font = font_with_fallback(font_name, { italic = true }),
	    }, {
	      italic = false,
	      font = font_with_fallback(font_name, { bold = true }),
	    }, {
	      intensity = "Bold",
	      font = font_with_fallback(font_name, { bold = true }),
	    },
	  },

	  enable_wayland = true,

	  -- Padding
	  window_padding = {
	    left = 25,
	    right = 25,
	    top = 25,
	    bottom = 25,
	  },

	  -- Tab Bar
	  enable_tab_bar = true,
	  hide_tab_bar_if_only_one_tab = true,
	  show_tab_index_in_tab_bar = false,
	  tab_bar_at_bottom = true,
	}
      '';
    };
  };
}


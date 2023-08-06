{ ... }:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      alias grep='grep --color=auto'
      alias ls='ls --color=auto'
      parse_git_branch() {
        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
      }
      export PS1="\n\[\033[1;35m\]  \u\[\033[1;34m\]\$(parse_git_branch) \[\033[0;36m\]\w\[\033[0m\]\n\[\033[0m\]\[\033[1;31m\] \[\033[0m\]"
      # Configure completion for doas
      # -c : Complete arguments as if they were commands
      #     (eg: `doas emer<tab>` -> `doas emerge`)
      #     (eg: `doas dd status=p<tab>` -> `doas dd status=progress`)
      # -f : Complete arguments as if they were directory names (default behaviour)
      #     (eg: `doas /bi<tab>` -> `doas /bin/`)
      complete -cf doas
    '';
  };
}

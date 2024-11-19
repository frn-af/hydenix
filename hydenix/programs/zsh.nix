{
  pkgs,
  ...
}:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
    };
    initExtra = ''
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme

      # Helpful aliases
      alias c='clear' # clear terminal
      alias l='eza -lh --icons=auto' # long list
      alias ls='eza -1 --icons=auto' # short list
      alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
      alias ld='eza -lhD --icons=auto' # long list dirs
      alias lt='eza --icons=auto --tree' # list folder as tree
      alias vc='code' # gui code editor

      alias cl='git clone'
      alias ad='git add'
      alias ba='git branch -a'
      alias bd='git branch -D'
      alias br='git branch'
      alias cam='git commit -am'
      alias co='git checkout'
      alias cob='git checkout -b'
      alias ci='git commit'
      alias cm='git commit -m'
      alias cp='git commit -p'
      alias d='git diff'
      alias dco='git commit -S --amend'
      alias s='git status'
      alias pr='git pull --rebase'
      alias st='git status'
      alias whoops='git reset --hard'
      alias wipe='git commit -s'

      # Directory navigation shortcuts
      alias ..='cd ..'
      alias ...='cd ../..'
      alias .3='cd ../../..'
      alias .4='cd ../../../..'
      alias .5='cd ../../../../..'

      # Always mkdir a path (this doesn't inhibit functionality to make a single dir)
      alias mkdir='mkdir -p'

      # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh  

      source $HOME/.local/state/nix/profiles/home-manager/home-path/share/hyde/hyde-cli/shell-completions/Hyde.zsh

      export PATH=$HOME/.local/bin:$PATH
      export PATH=$HOME/Development/kickstart.nixvim/result/bin:$PATH
    '';
    initExtraFirst = ''
      #Display Pokemonks
      pokemon-colorscripts --no-title -r 1-3
      # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
      # Initialization code that may require console input (password prompts, [y/n]
      # confirmations, etc.) must go above this block; everything else may go below.
      if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
        source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
      fi
    '';
  };
}

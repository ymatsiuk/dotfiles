{ pkgs, config, ... }:

{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    autocd = true;
    defaultKeymap = "viins";
    history.extended = true;
    history.path = ".config/zsh/zsh_history";
    dotDir = ".config/zsh";
    plugins = with pkgs; [
      {
        name = "zsh-syntax-highlighting";
        src = zsh-syntax-highlighting;
        file = "share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh";
      }
      {
        name = "zsh-history-substring-search";
        src = zsh-history-substring-search;
        file = "share/zsh-history-substring-search/zsh-history-substring-search.zsh";
      }
      {
        name = "zsh-git-plugin";
        src = lib.sourceFilesBySuffices ./. [ ".zsh" ];
        file = "zsh-git-plugin.zsh";
      }
      {
        name = "git";
        src = lib.sourceFilesBySuffices ./. [ ".zsh" ];
      }
    ];
    initExtra = with pkgs; ''
      export KEYTIMEOUT=1

      ZSH_AUTOSUGGEST_USE_ASYNC=1
      ZSH_AUTOSUGGEST_STRATEGY=(history completion)

      zmodload zsh/complist
      zstyle ':completion:*' menu select
      zstyle ':completion:*' insert-tab false
      # bindkey '^I' first-tab-completion
      bindkey -M menuselect '\e' send-break
      bindkey -M menuselect "$terminfo[kcbt]" reverse-menu-complete
      bindkey -M menuselect 'h' vi-backward-char
      bindkey -M menuselect 'k' vi-up-line-or-history
      bindkey -M menuselect 'l' vi-forward-char
      bindkey -M menuselect 'j' vi-down-line-or-history

      setopt HIST_FIND_NO_DUPS
      bindkey "$terminfo[kcuu1]" history-substring-search-up
      bindkey "$terminfo[kcud1]" history-substring-search-down
      bindkey -M vicmd 'k' history-substring-search-up
      bindkey -M vicmd 'j' history-substring-search-down

      setopt extendedglob
    '';
  };
}

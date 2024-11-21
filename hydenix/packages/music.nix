{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # --------------------------------------------------- // Music
    cava
    spicetify-cli # cli to customize spotify client
    spotify # spotify client
  ];
}

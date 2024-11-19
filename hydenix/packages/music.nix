{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # --------------------------------------------------- // Music
    spicetify-cli # cli to customize spotify client
    spotify # spotify client
  ];
}

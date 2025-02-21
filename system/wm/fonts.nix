{ pkgs, ... }:

{
  fonts.packages = with pkgs;
    [
      font-awesome
      powerline
      terminus_font
      nerd-fonts.symbols-only
    ];
}

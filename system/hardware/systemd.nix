{ ... }:

{
  services.logind.extraConfig =
  ''
    HandlePowerKey=ignore
    HandlePowerKeyLongPress=poweroff
    HandleLidSwitch=ignore
  '';
}

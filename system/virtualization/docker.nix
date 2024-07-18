{ ... }:

{
  users.users.whzd.extraGroups = [ "docker" ];
  virtualisation.docker.enable = true;
  virtualisation.docker.daemon.settings = {
    dns = ["1.1.1.1"];
  };
  virtualisation.docker.rootless = {
   enable = true;
   setSocketVariable = true;
   daemon.settings = {
    dns = ["1.1.1.1"];
   };
  };
}

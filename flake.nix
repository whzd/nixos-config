{
  description = "Flake of whzd";

  outputs = inputs@{ self, nixpkgs, home-manager, ... }:

  let
    systemSettings =
      {
        system = "x86_64-linux"; # system arch
        hostname = "midgard";
        profile = "midgard"; # select a profile defined from my profiles directory
        timezone = "Europe/Lisbon"; 
        locale = "pt_PT.UTF-8"; 
	extraLocale = "en_US.UTF-8"; 
        bootMode = "uefi"; # uefi or bios
      };
    # configure lib
    lib = nixpkgs.lib;
  in
    {
      nixosConfigurations =
        {
          ${systemSettings.hostname} = lib.nixosSystem
	    {
	      system = systemSettings.system;
	      modules = [ (./. + "/profiles" + ("/" + systemSettings.profile ) + "/configuration.nix") ];
	      specialArgs =
	        {
	          inherit systemSettings;
	        };
	    };
        };
    };
  inputs =
    {
      nixpkgs.url = "nixpkgs/nixos-unstable";

      home-manager.url = "github:nix-community/home-manager/master";
      home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };
}

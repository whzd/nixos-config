{
  description = "Flake of whzd";

  outputs = inputs@{ self, nixpkgs, home-manager, rust-overlay, ... }:

  let
    systemSettings =
      {
        system = "x86_64-linux"; # system arch
        hostname = "midgard";
        timezone = "Europe/Lisbon"; 
        locale = "pt_PT.UTF-8"; 
	extraLocale = "en_US.UTF-8"; 
        bootMode = "uefi"; # uefi or bios
      };
    userSettings =
      rec {
        username = "whzd";
        editor = "neovim";
      };
    pkgs =
      import nixpkgs {
        system = systemSettings.system;
        config = { allowUnfree = true;
                   allowUnfreePredicate = (_: true); };
        overlays = [ rust-overlay.overlays.default ];
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
	      modules = [ (./. + "/profiles" + ("/" + systemSettings.hostname ) + "/configuration.nix") ];
	      specialArgs =
	        {
	          inherit systemSettings;
	        };
	    };
        };
      homeConfigurations =
        {
	  ${userSettings.username} = home-manager.lib.homeManagerConfiguration
	    {
	      inherit pkgs;
	      modules = [ (./. + "/profiles" + ("/" + systemSettings.hostname ) + "/home.nix") ];
	      extraSpecialArgs =
	        {
		  inherit userSettings;
		};
	    };
	};
    };
  inputs =
    {
      nixpkgs.url = "nixpkgs/nixos-unstable";

      home-manager.url = "github:nix-community/home-manager/master";
      home-manager.inputs.nixpkgs.follows = "nixpkgs";

      rust-overlay.url = "github:oxalica/rust-overlay";
    };
}

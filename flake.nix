{
  description = "Flake of whzd";

  outputs =
  inputs@{ 
    self,
    nixpkgs,
    home-manager,
    rust-overlay,
    stylix,
    nixvim,
    ...
  }:

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
        editor = "nvim";
        theme = "everforest";
        font = "nerdfonts";
        fontPkg = pkgs.nerdfonts;
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
		  inherit (inputs) stylix;
	        };
	    };
        };
      homeConfigurations =
        {
	  ${userSettings.username} = home-manager.lib.homeManagerConfiguration
	    {
	      inherit pkgs;
	      modules =
	      [
	        (./. + "/profiles" + ("/" + systemSettings.hostname ) + "/home.nix")
		inputs.nixvim.homeManagerModules.nixvim
	      ];
	      extraSpecialArgs =
	        {
		  inherit userSettings;
		  inherit (inputs) stylix;
		  inherit (inputs) nixvim;
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

      stylix.url = "github:danth/stylix";

      nixvim.url = "github:nix-community/nixvim";
      nixvim.inputs.nixpkgs.follows = "nixpkgs";
    };
}

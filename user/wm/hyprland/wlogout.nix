{ pkgs, ... }:

{
  home.packages = with pkgs;
  [
    wlogout
  ];

  programs.wlogout =
    {
      enable = true;
      layout =
        [
	  {
              "label" = "lock";
              "action" = "sleep 1; swaylock-fancy -pe -t 'Nothing to see here..' -f 'Hack-Nerd-Font-Regular'";
              "text" = "Lock";
              "keybind" = "l";
          }
          {
              "label" = "hibernate";
              "action" = "sleep 1; systemctl hibernate";
              "text" = "Hibernate";
              "keybind" = "h";
          }
          {
              "label" = "logout";
              "action" = "sleep 1; loginctl terminate-user $USER";
              "text" = "Exit";
              "keybind" = "e";
          }
          {
              "label" = "shutdown";
              "action" = "sleep 1; systemctl poweroff";
              "text" = "Shutdown";
              "keybind" = "s";
          }
          {
              "label" = "suspend";
              "action" = "sleep 1; systemctl suspend";
              "text" = "Suspend";
              "keybind" = "u";
          }
          {
              "label" = "reboot";
              "action" = "sleep 1; systemctl reboot";
              "text" = "Reboot";
              "keybind" = "r";
          }
	];
  };
  home.file.".config/wlogout/icons/" =
  {
   source = ./icons;
   recursive = true;
  };
      home.file.".config/wlogout/style.css".text =
        ''
          * {
	  	background-image: none;
          	transition: 20ms;
          }
	  window {
	   background-color: rgba(12, 12, 12, 0.1);
          }
          button {
          	color: #FFFFFF;
              font-size:20px;
          
              background-repeat: no-repeat;
          	background-position: center;
          	background-size: 25%;
          
          	border-style: solid;
          	background-color: rgba(12, 12, 12, 0.3);
          	border: 3px solid #FFFFFF;
          
              box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
          }
          
          button:focus,
          button:active,
          button:hover {
          	background-color: rgba(12, 12, 12, 0.5);
          	border: 3px solid;
          }
          
          #lock {
          	margin: 10px;
          	border-radius: 20px;
		background-image: image(url("icons/lock.png"));
          }
          
          #logout {
          	margin: 10px;
          	border-radius: 20px;
		background-image: image(url("icons/logout.png"));
          }
          
          #suspend {
          	margin: 10px;
          	border-radius: 20px;
		background-image: image(url("icons/suspend.png"));
          }
          
          #hibernate {
          	margin: 10px;
          	border-radius: 20px;
		background-image: image(url("icons/hibernate.png"));
          }
          
          #shutdown {
          	margin: 10px;
          	border-radius: 20px;
		background-image: image(url("icons/shutdown.png"));
          }
          
          #reboot {
          	margin: 10px;
          	border-radius: 20px;
		background-image: image(url("icons/reboot.png"));
          }
	''; 
}

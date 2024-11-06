{ pkgs, ... }: {
  networking.wg-quick.interfaces = let
    server_ip = "gatevpn.bandora.ai";
  in {
    bandora = {
      address = [
        "10.27.0.14/24"
      ];

      listenPort = 51820;

      privateKey = "oML2UmdJRu/jJxKKmHJE+zOYjK5C7ByT7Db7y+FVMUw=";

      peers = [{
        publicKey = "J4aO5xLwZ09S+NixQnwEWmUN/myMfHyL9IT0TPH2Jkk=";
        allowedIPs = [ "10.27.0.0/16" ];
        endpoint = "${server_ip}:51820";
        persistentKeepalive = 25;
      }];
    };
  };
}


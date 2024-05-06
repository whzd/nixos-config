{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ansible
    terraform
    awscli2
    azure-cli
    docker
    qemu
  ];
}

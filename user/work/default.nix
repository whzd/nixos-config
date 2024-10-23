{ pkgs, ... }:

{
  home.packages = with pkgs; [
    _1password
    ansible
    terraform
    awscli2
    azure-cli
    docker
    qemu
    go
    kubectl
    kubernetes-helm
    argocd
  ];
}

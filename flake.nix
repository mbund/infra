{
  description = "Developer environment";

  inputs.devshell.url = "github:numtide/devshell";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = {
    self,
    flake-utils,
    devshell,
    nixpkgs,
  }:
    flake-utils.lib.eachDefaultSystem (system: {
      devShell = let
        pkgs = import nixpkgs {
          inherit system;

          overlays = [devshell.overlay];
        };
      in
        pkgs.devshell.mkShell {
          packages = with pkgs; [
            fluxcd
            kubectl
            kind
            go-task
            cloudflared
            sops
            k3sup
            envsubst
            openssl
            apacheHttpd
            jq
          ];
        };
    });
}

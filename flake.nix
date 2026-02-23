{
  description = "Nix flake for the kpl project.";

  outputs = {...}: {
    x86_64-linux = {
      overlays = {
        vscode = {
          dynamic-style = import ./nix/vscode/0001-dynamic-style.nix;
        };
      };
    };
  };
}

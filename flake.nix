{
  description = "Nix flake for the kpl project.";

  outputs = {...}: {
    overlays = {
      vscode = {
        dynamic-style = import ./nix/vscode/0001-dynamic-style.nix;
      };
    };
  };
}

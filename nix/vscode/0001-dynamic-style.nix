final: prev: {
  vscode = prev.vscode.overrideAttrs (old: {
    patches = (old.patches or []) ++ [ ../../source/vscode/0001-dynamic-style.patch ];
  });
}

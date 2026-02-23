{ pkgs, fetchFromGitHub }:

let
  myVscode = pkgs.vscode.overrideAttrs (old: {
    src = fetchFromGitHub {
      owner = "microsoft";
      repo = "vscode";
      rev = "1.106.2";
      sha256 = "sha256-...";
    };
    unpackPhase = ":";
    patches = (old.patches or []) ++ [./0001-dynamic-style.patch];
    buildPhase = ''
      export NODE_ENV=production
      yarn --frozen-lockfile
      ./scripts/npm.sh install
      ./scripts/code.sh compile
    '';
  });
in
{
  vscode = myVscode;
}
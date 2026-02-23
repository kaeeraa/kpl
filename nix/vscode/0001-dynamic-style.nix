{ fetchFromGitHub }: final: prev: {
  vscode = prev.vscode.overrideAttrs (old: {
    src = fetchFromGitHub {
      owner = "microsoft";
      repo = "vscode";
      rev = "1.106.2";
      sha256 = "";
    };

    unpackPhase = "true";

    patches = (old.patches or []) ++ [../../source/vscode/0001-dynamic-style.patch];

    buildPhase = ''
      export NODE_ENV=production
      yarn --frozen-lockfile
      ./scripts/npm.sh install
      ./scripts/code.sh compile
    '';
  });
}

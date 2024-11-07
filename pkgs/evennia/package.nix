{ pkgs, ... }:

let
  pythonPackages = pkgs.python312Packages;
  evennia =
    let
      pname = "evennia";
      version = "4.4.1";
    in
    pythonPackages.buildPythonPackage {
      inherit pname version;
      src = pkgs.fetchPypi {
        inherit pname version;
        sha256 = "sha256-y4czKWYD6O/UIsHSyP0a8NumxuzPVVyuRV8rqDay0FA=";
      };
      doCheck = false;
    };
in
pkgs.mkShell {
  buildInputs = with pythonPackages; [
    python
    more-itertools
    networkx
    types-networkx
    pytest
    black
    isort
    pylama
    setuptools
    toml
  ] ++ [ pkgs.gnupg ];
}

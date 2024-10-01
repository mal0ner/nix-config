{
  perSystem = {pkgs, ...}: {
    packages = {
      pragmasevka = pkgs.callPackage ./pragmasevka {};
    };
  };
}

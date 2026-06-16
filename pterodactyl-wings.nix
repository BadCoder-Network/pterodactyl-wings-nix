{
  lib,
  buildGo126Module,
  fetchFromGitHub,
}:
buildGo126Module rec {
  pname = "pterodactyl-wings";
  version = "1.13.0";

  src = fetchFromGitHub {
    owner = "pterodactyl";
    repo = "wings";
    rev = "v${version}";
    sha256 = "sha256-xGDJ4nXekh6AwjAb44kkedEh0aLTcWNzv4IyGQGnDRg";
  };

  vendorHash = "sha256-BtATik0egFk73SNhawbGnbuzjoZioGFWeA4gZOaofTI=";
  subPackages = ["."];

  ldflags = [
    "-X github.com/pterodactyl/wings/system.Version=${version}"
  ];

  meta = with lib; {
    description = "The server control plane for Pterodactyl Panel. Written from the ground-up with security, speed, and stability in mind";
    homepage = "https://github.com/pterodactyl/wings";
    license = licenses.mit;
    mainProgram = "wings";
    changelog = "https://github.com/pterodactyl/wings/releases/tag/v${version}";
    platforms = platforms.linux;
  };
}

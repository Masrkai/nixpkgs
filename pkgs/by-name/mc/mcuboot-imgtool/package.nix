{
  lib,
  fetchPypi,
  python3Packages,
  nix-update-script,
}:

python3Packages.buildPythonApplication rec {
  pname = "mcuboot-imgtool";
  version = "2.1.0";
  pyproject = true;

  src = fetchPypi {
    inherit version;
    pname = "imgtool";
    hash = "sha256-T3+831PETqqmImUEUQzLUvfvAMmXUDz5STSzMMlge2A=";
  };

  passthru.updateScript = nix-update-script { };

  nativeBuildInputs = with python3Packages; [ setuptools ];

  propagatedBuildInputs = with python3Packages; [
    cbor2
    click
    cryptography
    intelhex
    pyyaml
  ];

  meta = with lib; {
    description = "MCUboot's image signing and key management";
    homepage = "https://github.com/mcu-tools/mcuboot/tree/main/scripts";
    license = licenses.asl20;
    maintainers = with maintainers; [ otavio ];
    mainProgram = "imgtool";
  };
}

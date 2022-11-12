{ lib
, buildPythonPackage
, fetchPypi
, nose
}:

buildPythonPackage rec {
  pname = "colored";
  version = "1.4.4";
  format = "setuptools";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-BP9NTdUUJ0/juZohu1L7lvJojAHpP7p77zciHny1bOA=";
  };

  checkInputs = [ nose ];

  checkPhase = ''
    nosetests
  '';

  pythonImportsCheck = [
    "colored"
  ];

  meta = with lib; {
    homepage = "https://gitlab.com/dslackw/colored";
    description = "Simple library for color and formatting to terminal";
    license = licenses.mit;
  };

}

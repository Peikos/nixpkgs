{ stdenv, fetchFromGitHub, buildPythonApplication, dateutil }:

buildPythonApplication rec {
  pname = "pdd";
  version = "1.1";

  src = fetchFromGitHub {
    owner = "jarun";
    repo = "pdd";
    rev = "v${version}";
    sha256 = "1nb64vdlym4najjyfxq1nprqcwgrwnqj1mml0fcg20hrgbjm4bf2";
  };

  format = "other";

  propagatedBuildInputs = [ dateutil ];

  installFlags = [ "PREFIX=$(out)" ];

  meta = with stdenv.lib; {
    homepage = "https://github.com/jarun/pdd";
    description = "Tiny date, time diff calculator";
    longDescription = ''
      There are times you want to check how old you are (in years, months, days)
      or how long you need to wait for the next flash sale or the number of days
      left of your notice period in your current job. pdd (Python3 Date Diff) is
      a small cmdline utility to calculate date and time difference. If no
      program arguments are specified it shows the current date, time and
      timezone.
    '';
    maintainers = [ maintainers.infinisil ];
    license = licenses.gpl3;
  };
}
# About #

`Fibeamer` is a beamer theme for the typesetting of thesis defense
presentations at the Masaryk University (Brno, Czech Republic). The
theme has been designed for easy extensibility by style and locale
files of other academic institutions.

# Installation #
## Requirements ##

To install the package, you are going to need a POSIX.2-compliant
environment as well as the following tools:

  * GNU `make`
  * `inkscape`

Aside from these tools, the installation requires a correctly
configured TeX distribution containing the pdfTeX and XeTeX engines
as well as the LaTeX packages required for the typesetting of the
technical documentation within the `fithesis.dtx` file and the
guide files within the `guide/` subdirectory.

## Procedure ##

To begin the installation, execute the following command from within
the current directory:

    make complete
    make install to=[[TDS]] nohash=true

and replace `[[TDS]]` with a path to the TeX directory structure into
which you want to install the package (such as `/usr/share/texmf`).
If necessary, update the file name database of your TeX
distribution:

  * In MiKTeX:
    - Using the GUI: In the Start Menu go to the MiKTeX entry and
      open either the settings or the admin settings depending on
      whether you are installing the package into a single-user
      private directory tree or into a shared directory tree on a
      multi-user system, respectively. The "MiKTeX Options" window
      will open. Switch to the "General" tab and click the "Refresh
      FNDB" button.
    - Using the command prompt: Execute either `initexmf -u` or
      `initexmf -u --admin` depending on whether you are installing
      the package into a single-user private directory tree or into
      a shared shared directory tree on a multi-user system,
      respectively.
  * In TeX Live:
    - Execute `texhash` with superuser privileges (`sudo texhash`).

To uninstall the package, execute the following command from within
the current directory:

    make uninstall from=[[TDS]] nohash=true

and replace `[[TDS]]` with a path to the TeX directory structure into
which you want to install the package (such as `/usr/share/texmf`).
If necessary, update the file name database of your TeX
distribution.

# About #

`Fibeamer` is a beamer theme for the typesetting of thesis defense
presentations at the Masaryk University (Brno, Czech Republic). The
theme has been designed for easy extensibility by style and locale
files of other academic institutions.

# Requirements #

To install the package, you are going to need a POSIX.2-compliant
environment as well as the following tools:

  * GNU `make`
  * `inkscape`
  * `pdftops`

Aside from these tools, the installation requires a correctly
configured TeX distribution containing the pdfTeX and XeTeX engines
as well as the LaTeX packages required for the typesetting of the
technical documentation within the `fibeamer.dtx` file and the
guide files within the `guide/` subdirectory.

(For running the test suite using the `make tests` command, the
`comparepdf` command is also required.)

# Installation #

To install the package, execute the following command from within
the current directory:

    make all
    make install-base to=[[TDS]] nohash=true

where `[[TDS]]` is a path in the TeX directory structure to which
you are going to install the package (such as `/usr/share/texmf`).

After successfully running the commands, update the file name
database of your TeX distribution, if necessary:

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
      a shared shared directory tree on a multi-user system.
  * In TeX Live and MacTeX:
    - Execute `texhash` with superuser privileges (`sudo texhash`).

You may now also wish to typeset and install the user and technical
documentation of the package. You can do that by running:

    make docs
    make install-docs to=[[TDS]] nohash=true

where `[[TDS]]` is again a path in the TeX directory structure to
which you are going to install the documentation and will likely be
the same as before.

After successfully running the commands, update the file name
database of your TeX distribution, if necessary.

# Uninstallation #

To uninstall the package, execute the following command from within
the current directory:

    make uninstall from=[[TDS]]

where `[[TDS]]` is a path in the TeX directory structure to which
you are going to install the package (such as `/usr/share/texmf`).

After successfully running the commands, update the file name
database of your TeX distribution, if necessary:

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
      a shared shared directory tree on a multi-user system.
  * In TeX Live and MacTeX:
    - Execute `texhash` with superuser privileges (`sudo texhash`).

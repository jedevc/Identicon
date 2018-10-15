# Identicon

This repository contains implementations of github-style identicon generation
in different languages.

## Building

Navigate to the identicons directory, and then run the following:

	$ ./build.sh

Then you can navigate to the build folder and execute the code:

	$ cd build/
	$ java Identicon

Each program will output an svg over stdout. To generate an svg file, use bash
redirection:

	$ java Identicon > identicon.svg

Note that all the source files, even the ones in interpreted languages, should
not be executed from the `source/` directory. Run `build.sh` and execute them
from the `build/` directory.

## Licensing

All of this is licensed under the UNLICENSE. Do whatever you want with it.

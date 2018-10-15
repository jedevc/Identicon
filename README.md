# Identicon

This repository contains implementations of github-style identicon generation
in different languages.

## Building

Navigate to the identicons directory, and then run the following:

	$ ./build.sh

Then you can navigate to the specific build you want, e.g.:

	$ cd build/java/
	$ java Identicon

Each program will output an svg over stdout. To generate an svg file:

	$ java Identicon > identicon.svg

## Licensing

All of this is licensed under the UNLICENSE. Do whatever you want with it.

#!/bin/bash

BUILD=build/
mkdir -p $BUILD/

ACTION=0

if [[ source/Identicon.java -nt $BUILD/Identicon.class ]]; then
	echo "Building java..."
	ACTION=1

	javac -d $BUILD source/Identicon.java
fi

if [[ source/Identicon.sh -nt $BUILD/Identicon.sh ]]; then
	echo "Building bash..."
	ACTION=1

	cp source/Identicon.sh $BUILD/Identicon.sh
	chmod u+x $BUILD/Identicon.sh
fi

if [[ $ACTION -eq 1 ]]; then
	echo "Done."
else
	echo "Nothing to do."
fi

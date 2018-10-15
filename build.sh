#!/bin/bash

BUILD=build/

mkdir -p $BUILD/java
javac -d $BUILD/java java/Identicon.java

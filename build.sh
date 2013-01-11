#!/bin/bash

# Copyright (c) 2012  XULApp StarterKit racklin@gmail.com

CALLDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $CALLDIR/config.sh

PACKAGENAME="xulapp-starterkit-addon-nodejs"
VERSION="0.8.17"

BUILDID=`date +%Y%m%d`

echo "Building NodeJS Runtime for XULApp StarterKit"

# Remove build directory
if [ ! -d "$BUILDDIR" ]; then mkdir -p "$BUILDDIR"; fi

# Copy app directory
cp -RH "$CALLDIR/chrome" "$BUILDDIR/"
cp -RH "$CALLDIR/defaults" "$BUILDDIR/"
cp -RH "$CALLDIR/nodejs" "$BUILDDIR/"
cp "$CALLDIR/chrome.manifest" "$BUILDDIR/"
cp "$CALLDIR/install.rdf" "$BUILDDIR/"

# Make sure DISTDIR exists
if [ ! -d "$DISTDIR" ]; then mkdir -p "$DISTDIR"; fi

cd "$BUILDDIR" && zip -rqX "$DISTDIR/${PACKAGENAME}-${VERSION}.xpi" *

rm -rf $BUILDDIR

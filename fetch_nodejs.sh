#!/bin/bash

# Copyright (c) 2011  Zotero
#                     Center for History and New Media
#                     George Mason University, Fairfax, Virginia, USA
#                     http://zotero.org
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

CALLDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. "$CALLDIR/config.sh"
SITE="http://nodejs.org/dist/$NODEJS_VERSION/"

while getopts "p:" opt; do
	case $opt in
		p)
			BUILD_MAC=0
			BUILD_WIN=0
			BUILD_LINUX=0
			for i in `seq 0 1 $((${#OPTARG}-1))`
			do
				case ${OPTARG:i:1} in
					m) BUILD_MAC=1;;
					w) BUILD_WIN=1;;
					l) BUILD_LINUX=1;;
					*)
						echo "$0: Invalid platform option ${OPTARG:i:1}"
						usage
						;;
				esac
			done
			;;
	esac
	shift $((OPTIND-1)); OPTIND=1
done

rm -rf nodejs
mkdir nodejs
cd nodejs

if [ $BUILD_MAC == 1 ]; then
    # x86
	curl -O $SITE/node-$NODEJS_VERSION-darwin-x86.tar.gz
	tar -xzf node-$NODEJS_VERSION-darwin-x86.tar.gz
        mv node-$NODEJS_VERSION-darwin-x86 darwin-x86
	rm node-$NODEJS_VERSION-darwin-x86.tar.gz
    # x64
	curl -O $SITE/node-$NODEJS_VERSION-darwin-x64.tar.gz
	tar -xzf node-$NODEJS_VERSION-darwin-x64.tar.gz
        mv node-$NODEJS_VERSION-darwin-x64 darwin-x64
	rm node-$NODEJS_VERSION-darwin-x64.tar.gz
fi

if [ $BUILD_WIN == 1 ]; then
    # x86
	curl -O $SITE/node.exe
        mkdir -p windows-x86
        mv node.exe windows-x86/
    # x64
#	curl -O $SITE/x64/node.exe
#       mkdir -p windows-x64
#       mv node.exe windows-x64/
fi

if [ $BUILD_LINUX == 1 ]; then
    # x86
	curl -O $SITE/node-$NODEJS_VERSION-linux-x86.tar.gz
	tar -xzf node-$NODEJS_VERSION-linux-x86.tar.gz
        mv node-$NODEJS_VERSION-linux-x86 linux-x86
	rm node-$NODEJS_VERSION-linux-x86.tar.gz
    # x64
	curl -O $SITE/node-$NODEJS_VERSION-linux-x64.tar.gz
	tar -xzf node-$NODEJS_VERSION-linux-x64.tar.gz
        mv node-$NODEJS_VERSION-linux-x64 linux-x64
	rm node-$NODEJS_VERSION-linux-x64.tar.gz
fi

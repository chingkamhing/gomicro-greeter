#!/bin/bash

#
# Script to get and build different versions of proto-gen-go in order to try which version of it that go-micro is using.
#

# protobuf directory
PB_DIR="${GOPATH}/src/github.com/golang/protobuf"
# try versions of https://github.com/golang/protobuf
# note: 1.4.X has no Makefile, don't know how to install, skipped that version
VERSIONS=( \
	"v1.3.5" \
	"v1.2.0" \
	"v1.1.0" \
	"v1.0.0" \
)
# either 0 argument
NUM_ARGS=0

# Function
SCRIPT_NAME=${0##*/}
Usage () {
	echo
	echo "Description:"
	echo "Script to get and build different versions of proto-gen-go in order to try which version of it that go-micro is using."
	echo
	echo "Usage: $SCRIPT_NAME"
	echo "Options:"
	echo " -h                           This help message"
	echo
}

# Parse input argument(s)
while [ "${1:0:1}" == "-" ]; do
	OPT=${1:1:1}
	case "$OPT" in
	"h")
		Usage
		exit
		;;
	esac
	shift
done

if [ "$#" -ne "$NUM_ARGS" ]; then
    echo "Invalid parameter!"
	Usage
	exit 1
fi

PROTOC_GEN_GO=$(which protoc-gen-go)

# git checkout different versions, make and save the output binary
echo "PB_DIR: ${PB_DIR}"
# git -C ${PB_DIR} fetch --all --tags
git -C ${PB_DIR} --no-pager tag --list
for version in "${VERSIONS[@]}"; do
	echo "Trying $PB_URL version $version ..."
	# checkout and build protobuf
	git -C ${PB_DIR} checkout $version
	make -C ${PB_DIR} install
	cp $PROTOC_GEN_GO ${PROTOC_GEN_GO}.${version}
done

# restore to latest checkout
git -C ${PB_DIR} checkout master

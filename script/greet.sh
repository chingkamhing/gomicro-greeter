#!/bin/bash
#
# Script file to use curl command to send greet to greeter and expect a response of a greeting.
#

URL="http://localhost:8080"
ENDPOINT="greeter/hello"
NUM_ARGS=1
FILE_COOKIE=".cookie"
OPTS=""

# Function
SCRIPT_NAME=${0##*/}
Usage () {
	echo
	echo "Description:"
	echo "Script file to use curl command to send greet to greeter and expect a response of a greeting."
	echo
	echo "Usage: $SCRIPT_NAME [user name who will be greeted]"
	echo "Options:"
	echo " -k                           Allow https insecure connection"
	echo " -u  [url]                    IMS Customer Portal URL"
	echo " -h                           This help message"
	echo
}

# Parse input argument(s)
while [ "${1:0:1}" == "-" ]; do
	OPT=${1:1:1}
	case "$OPT" in
	"k")
		OPTS="$OPTS -k"
		;;
	"u")
		URL=$2
		shift
		;;
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

# trim URL trailing "/"
URL="$(echo -e "${URL}" | sed -e 's/\/*$//')"

USERNAME=$1

# list all users' info
curl $OPTS -vd "{\"name\":\"$USERNAME\"}" \
	-H "Content-Type: application/json" \
	-H "Accept: application/json" \
	${URL}/${ENDPOINT}

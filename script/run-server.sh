#!/bin/bash
#
# Script file to run greeter service and gateway.
#

./greeter/greeter-srv --server_address=localhost:9090 &
./gateway/greeter-gw &

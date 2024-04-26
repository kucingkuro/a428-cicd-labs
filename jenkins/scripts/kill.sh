#!/usr/bin/env sh

#!/bin/bash

echo 'The following command terminates the "npm start" process using its PID'
echo '(written to ".pidfile"), all of which were conducted when "deliver.sh"'
echo 'was executed.'

# Check if .pidfile exists
if [ ! -f .pidfile ]; then
    echo "Error: .pidfile not found."
    exit 1
fi

# Read PID from .pidfile
pid=$(cat .pidfile)

# Check if the PID exists
if ps -p $pid > /dev/null; then
    # Kill the process
    set -x
    kill $pid
    echo "Process with PID $pid terminated."
else
    echo "Process with PID $pid not found."
fi

#!/bin/bash
echo -n "WARNING: This package contains security vulnerabilities. Do you want to continue installation ? (y/n) " >/dev/tty

if exec </dev/tty; then
    read response;
fi

if [ "$response" = "y" ] || [ "$response" = "Y" ]; then
    echo "**** Installing zimbra-help ****"
else
    echo "Action cancelled. Terminating the installation process."
    exit 1
fi

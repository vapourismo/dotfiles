#!/bin/sh

. /etc/profile.d/nix.sh

systemctl --user import-environment PATH NIX_PATH NIX_SSL_CERT_FILE

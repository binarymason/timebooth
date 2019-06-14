#!/usr/bin/env bash

set -e

echo "+ moving recovery.conf into place"
cp /var/lib/postgresql/recovery.conf.sample /var/lib/postgresql/data/recovery.conf



#!/bin/sh
#
# Note: In the real world, backups and snapshots would be centrally located somewhere.
# This is a hacky script to simulate that by organizing various volume mounts
# into a single host directory.
#
# Watches a directory and automatically copies any files to
# another target directory
#
# Usage:
# archive.sh /usr/src/from_dir /usr/src/archive/to_dir

set -eu

from_path="$1"
to_path="$2"

inotifywait -m -r -e moved_to -e close_write --format "%e %w%f" "$from_path" |
  while read event full_path; do
    echo "Event: $event, Path: $full_path"

    # Parse out dirname of changed file to ensure that file is properly
    # organized in the same dirname in the archive.
    #
    # Example:
    # /target/<directory-name>/filename.txt -> /archive/<directory-name>/filename.txt
    #
    file_dir_path="$(dirname $full_path)"
    file_dir_name="$(basename $file_dir_path)"
    file_name="$(basename $full_path)"
    to_dir="$to_path/$file_dir_name"
    dest="$to_dir/$file_name"

    echo "+ copying $full_path to $dest"
    mkdir -p "$to_dir"
    cp -au "$full_path" "$dest"
  done

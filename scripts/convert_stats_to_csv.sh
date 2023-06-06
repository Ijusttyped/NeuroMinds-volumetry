#!/bin/bash

IN_FILENAME="${2:-aparc.DKTatlas+aseg.deep.volume.stats}"
files_found=$(find "${1:-data}" -name "${IN_FILENAME}" -print0 | xargs -0)

for file in $files_found; do
  echo "Processing ${file}"

  out_dir="$(dirname ${file})/"

  header=($(grep ColHeaders ${file} | sed 's/ColHeaders  //' | tr ' ' ','))
  header=${header#*,}

  # Modify the sed command to remove leading whitespaces as well
  grep -v '^#' ${file} | sed -E 's/^ +| +$//g' | tr -s ' ' ',' > mystats.tmp

  # Add the header directly instead of using echo
  printf "%s\n" "${header[*]}" > header.tmp

  # Combine the header and the stats using cat
  cat header.tmp mystats.tmp > "${out_dir}"stats.csv

  # Remove temporary files
  rm mystats.tmp header.tmp
done

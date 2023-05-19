#!/bin/bash

IN_FILENAME="${2:-aparc.DKTatlas+aseg.deep.volume.stats}"
files_found=$(find "${1:-data}" -name "${IN_FILENAME}" -print0 | xargs -0)

for file in $files_found; do
  echo "Processing ${file}"

  out_dir="$(dirname ${file})/"

  header=($(grep ColHeaders ${file} | sed 's/ColHeaders  //' | tr ' ' ','))
  grep -v '^#' ${file} | sed 's/  */,/g' > mystats.tmp
  echo "${header[*]}" | cat - mystats.tmp > mystats_with_header.tmp
  mv mystats_with_header.tmp "${out_dir}"stats.csv
  rm mystats.tmp
done
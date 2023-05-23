#!/bin/bash
IN_FILENAME="${2:-*.nii.gz}"

files_found=$(find "${1:-data}" -name "${IN_FILENAME}" -print0 | xargs -0)

for file in $files_found; do
  echo "Processing ${file}"

  out_dir="$(dirname ${file})/"

  if [ ! -f ${out_dir}/fastsurfer_out/stats/aparc.DKTatlas+aseg.deep.volume.stats ]; then
    docker run  -v "${PWD}"/data:/data \
                -v "${PWD}"/freesurfer_license:/fs_license \
                --rm --user $(id -u):$(id -g) \
                deepmi/fastsurfer:latest \
                --fs_license /fs_license/license.txt \
                --sid fastsurfer_out \
                --sd /"${out_dir}" \
                --t1 /"${file}" \
                --vol_segstats \
                --parallel \
                --seg_only
  fi
done

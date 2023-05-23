#!/bin/bash

IN_DATADIR="${1:-data}"
IN_FILENAME="${2:-*.nii.gz}"

echo "Running pipeline on ${IN_DATADIR}/${IN_FILENAME}"
sh scripts/run_fastsurfer.sh "${IN_DATADIR}" "${IN_FILENAME}"
sh scripts/convert_stats_to_csv.sh "${IN_DATADIR}"
pip install pandas==2.0.1
python scripts/consolidate_stats.py -i "${IN_DATADIR}" -o "${IN_DATADIR}/volume_stats_all_subjects.csv"

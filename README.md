# NeuroMinds-Volumetry

## Reproducing

1. Get a license from FreeSurfer: https://surfer.nmr.mgh.harvard.edu/registration.html and place the
`license.txt` file in the `freesurfer_license` folder.
2. Download the data
3. Pull the fastsurfer docker image: `docker pull deepmi/fastsurfer:latest`
4. Run the script to calculate the volumes. On Windows you probably need to run in Git Bash:

```bash
sh scripts/run_fastsurfer.sh
```

5. After the script has finished, the results are in the folder of the respective scan in the file `aparc.DKTatlas+aseg.deep.volume.stats`
6. Convert all the `.stats` files to csv with

```bash
sh scripts/convert_stats_to_csv.sh
```

TODO: Consolidate all the single csv files into one big csv file.
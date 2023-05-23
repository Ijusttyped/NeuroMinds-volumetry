# NeuroMinds-Volumetry

## Running the Volumetry Pipeline

### Requirements

- Docker
- Python 3.x
- FreeSurfer license
- Data

### Installation

To install Docker, follow the instructions on the [Docker website](https://docs.docker.com/get-docker/).
Pull the FastSurfer docker image: `docker pull deepmi/fastsurfer:latest`.
To install Python, follow the instructions on the [Python website](https://www.python.org/downloads/).
To install the Python dependencies, run

```bash
pip install -r requirements.txt
```

To get a FreeSurfer license, go to https://surfer.nmr.mgh.harvard.edu/registration.html and follow the instructions.
The license file will be sent to you via email. Save the license file in the `freesurfer_license` directory of this repository.

### Data

The data need to be stored in a folder with read/write access. The folder structure should be as follows:

```
data
├── subject_001
│   ├── img_001.nii.gz
├── subject_002
│   ├── img_001.nii.gz
.
.
.
```

Make sure that each subject has a folder with the respective scans. The scans need to be in the NIfTI format.
If the scans are in Dicom format, you can convert them to NIfTI with our conversion script.

```bash
python convert_dcm_to_nifti.py --input_dir <input_dir_to_dicom_files> --output_dir <output_dir_to_store_nifti_files>
```

### Running the Pipeline

Move to the root directory of this repository and run the following command:

```bash
sh scripts/run_pipeline.sh <dir_to_the_data> <file_pattern>
```

The `<dir_to_the_data>` is the path to the folder where the data is stored, e.g. `data/OASIS1`.
The `<file_pattern>` is the pattern of the files to run the pipeline on, e.g. `img_*.nii.gz`.

The pipeline will create a file `volume_stats_all_subjects.csv` in the provided data directory.
This file contains the volume statistics for all subjects.
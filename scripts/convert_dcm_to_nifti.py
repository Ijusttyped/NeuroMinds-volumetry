from pathlib import Path
import argparse
import pydicom
import nibabel as nib


def convert_dicom_to_nifti(input_dir, output_dir):
    """Convert DICOM files to NIFTI files"""
    input_dir = Path(input_dir)
    output_dir = Path(output_dir)
    if not output_dir.exists():
        output_dir.mkdir(parents=True)

    dicom_files = list(input_dir.rglob("*.dcm"))

    for file in dicom_files:
        dicom_data = pydicom.dcmread(file.as_posix())
        pixel_array = dicom_data.pixel_array
        nifti_image = nib.Nifti1Image(pixel_array, dicom_data.pixel_array)
        output_file = output_dir / f"{file.stem}.nii.gz"
        nib.save(nifti_image, output_file)
        print(f"{file.as_posix()} -> {output_file.as_posix()}")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Convert DICOM to NIFTI")
    parser.add_argument(
        "--input_dir", "-i", type=str, help="Input directory containing DICOM files"
    )
    parser.add_argument(
        "--output_dir",
        "-o",
        type=str,
        help="Output directory to save NIFTI files",
    )
    args = parser.parse_args()
    convert_dicom_to_nifti(args.input_dir, args.output_dir)

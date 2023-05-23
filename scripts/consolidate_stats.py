from pathlib import Path
import argparse
import pandas as pd


def consolidate_stats_files(input_dir: str, output_file: str):
    """Consolidate stats files into a single csv file"""
    stats = []
    for file in Path(input_dir).rglob("stats.csv"):
        data = pd.read_csv(file)
        stats.append(data)
    stats_data = pd.concat(stats)
    stats_data.to_csv(output_file, index=False)
    print(
        f"Consolidated stats file with {len(stats_data)} records saved to {output_file}"
    )


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Consolidate stats files")
    parser.add_argument(
        "--input_dir", "-i", type=str, help="Input directory containing stats files"
    )
    parser.add_argument(
        "--output_file",
        "-o",
        type=str,
        help="Output file with file ending '.csv' to save consolidated stats",
    )
    args = parser.parse_args()
    consolidate_stats_files(args.input_dir, args.output_file)

import pandas as pd

data = pd.read_csv("stats.csv")

ventricle_names = [v for v in data.StructName.values if v.find("Ventricle") != -1]
hippocampus_names = [v for v in data.StructName.values if v.find("Hippo") != -1]

print("Ventricle names: ", ventricle_names)
print("Hippocampus names: ", hippocampus_names)

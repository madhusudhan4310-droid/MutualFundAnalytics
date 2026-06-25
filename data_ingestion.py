import pandas as pd
import os

DATA_FOLDER = "data/raw"

csv_files = [f for f in os.listdir(DATA_FOLDER) if f.endswith(".csv")]

for file in csv_files:
    print("\n" + "=" * 80)
    print(f"DATASET: {file}")
    print("=" * 80)

    path = os.path.join(DATA_FOLDER, file)

    try:
        df = pd.read_csv(path)

        print("\nSHAPE:")
        print(df.shape)

        print("\nDTYPES:")
        print(df.dtypes)

        print("\nHEAD:")
        print(df.head())

        print("\nMISSING VALUES:")
        print(df.isnull().sum())

    except Exception as e:
        print(f"Error reading {file}: {e}")
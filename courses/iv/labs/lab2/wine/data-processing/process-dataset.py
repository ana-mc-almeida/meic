import pandas as pd
import re
import numpy as np

pd.options.mode.chained_assignment = None  # default='warn'
pd.options.display.max_rows = 9999

# Import dataset
df = pd.read_csv('./src/winemag-data-130k-v2.csv')

# Drop records with NAs
def clean_dataset(df: pd.DataFrame) -> pd.DataFrame:
    return df.dropna()

# Drop unused columns
def remove_features(df: pd.DataFrame) -> pd.DataFrame:
    # Remove columns that will not be used in the demo/workshop
    return df.drop(["description","designation","taster_name","taster_twitter_handle","region_1","region_2"], axis=1)

# Define a function to extract the year from a string
def extract_year(title):
    # Use regular expression to find the year in the string
    year_match = re.search(r'\b\d{4}\b', title)
    if year_match:
        return int(year_match.group())
    else:
        return np.nan

# Add new column "year" based on the year reported in the title of each wine
def create_features(df: pd.DataFrame) -> pd.DataFrame:
    return df.assign(
        year=lambda x : x['title'].apply(extract_year).apply(lambda y: int(y) if not pd.isna(y) else 0)
        )

# Keep only tastings starting in 2010 and wines from Portugal
def filter_dataset(df: pd.DataFrame) -> pd.DataFrame:
    return df[(df['year'] >= 2010) & (df['country'] == 'Portugal')]

# Keep only 350 records in a fixed random state
def sample_dataset(df: pd.DataFrame) -> pd.DataFrame:
    return df.sample(n=350, random_state=42)

# Drop unused columns
def final_touches(df: pd.DataFrame) -> pd.DataFrame:
    return df.drop(["country"], axis=1)

def preprocess_data(df: pd.DataFrame) -> pd.DataFrame:
    return(
        df
        .pipe(remove_features)
        .pipe(clean_dataset)
        .pipe(create_features)
        .pipe(filter_dataset)
        .pipe(sample_dataset)
        .pipe(final_touches)
    )

df = preprocess_data(df)
df.to_csv('./export/dataset.csv', index=False)
df.to_json('../data/dataset.json', index=False, orient="records")
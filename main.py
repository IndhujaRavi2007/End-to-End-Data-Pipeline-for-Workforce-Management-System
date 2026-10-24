import requests
import pandas as pd
import logging
import kagglehub
import os
import glob
 
logging.basicConfig(level=logging.INFO)
logger=logging.getLogger(__name__)

def extract_from_kaggle():
    logger.info("Downloading via Kaggle API...")
    path=kagglehub.dataset_download("pavansubhasht/ibm-hr-analytics-attrition-dataset")
    csv_files=glob.glob(os.path.join(path,"*.csv"))
    csv_file=csv_files[0]
    logger.info(f"Fetching from{csv_file}")
    df=pd.read_csv(csv_file)
    return df

    

def transform_data(raw_data):
    df=pd.DataFrame(raw_data)
    logger.info(f"Before data cleaning:{df.shape}")
    df=df.dropna()
    df=df.drop_duplicates()
    logger.info(f"Cleaned data shape:{df.shape}")
    return df

def load_data(df,output_path):
    os.makedirs(os.path.dirname(output_path),exist_ok=True)
    df.to_csv("output_path",index=False)
   
    logger.info(f"File saved to {output_path}")

if __name__=="__main__":
    df=extract_from_kaggle()
    
    clean_df=transform_data(df)
    load_data(clean_df,"data/cleaned/employee_cleaned.csv")
    print("loaded successfully !")
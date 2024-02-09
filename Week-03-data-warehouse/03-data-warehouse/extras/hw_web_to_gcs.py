import os
import pandas as pd
import pyarrow.csv as pv
import pyarrow.parquet as pq
import pyarrow as pa
import requests
from google.cloud import storage
import logging
import subprocess

"""
Pre-reqs: 
1. `pip install pandas pyarrow google-cloud-storage`
2. Set GOOGLE_APPLICATION_CREDENTIALS to your project/service-account key
3. Set GCP_GCS_BUCKET as your bucket or change default value of BUCKET
"""

# services = ['fhv','green','yellow']
init_url = 'https://d37ci6vzurychx.cloudfront.net/trip-data' #green_tripdata_2022-01.parquet
BUCKET = os.environ.get("GCP_GCS_BUCKET", "mage-zoomcamp_art")


def upload_to_gcs(bucket, object_name, local_file):
    """
    Ref: https://cloud.google.com/storage/docs/uploading-objects#storage-upload-object-python
    """
    # # WORKAROUND to prevent timeout for files > 6 MB on 800 kbps upload speed.
    # # (Ref: https://github.com/googleapis/python-storage/issues/74)
    # storage.blob._MAX_MULTIPART_SIZE = 5 * 1024 * 1024  # 5 MB
    # storage.blob._DEFAULT_CHUNKSIZE = 5 * 1024 * 1024  # 5 MB

    client = storage.Client()
    bucket = client.bucket(bucket)
    blob = bucket.blob(object_name)
    blob.upload_from_filename(local_file)


def web_to_gcs(year, service):
    for i in range(13):
        if i != 12:
            month = '0'+str(i+1)
            month = month[-2:]
            file_name = f"{service}_tripdata_{year}-{month}.parquet"
            request_url = f"{init_url}/{file_name}"
            r = requests.get(request_url)
            open(file_name, 'wb').write(r.content)
            print(f"Local: {file_name}")
            upload_to_gcs(BUCKET, f"{service}/{file_name}", file_name)
            print(f"GCS: {service}/{file_name}")
            os.system(f"rm {file_name}")


            


#web_to_gcs('2019', 'green')
web_to_gcs('2022', 'green')
#web_to_gcs('2019', 'yellow')
#web_to_gcs('2020', 'yellow')
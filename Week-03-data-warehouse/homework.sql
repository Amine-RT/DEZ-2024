
-- Question 1
-- Creating external table referring to gcs path
CREATE OR REPLACE EXTERNAL TABLE `de-zoomcamp-2024.nytaxi.external_green_tripdata`
OPTIONS (
  format = 'PARQUET',
  uris = ['gs://mage-zoomcamp_art/green/green_tripdata_2022-*.parquet']
);
-- Check yello trip data
SELECT COUNT(*) FROM de-zoomcamp-2024.nytaxi.external_green_tripdata;

-- Create a non partitioned table from external table
CREATE OR REPLACE TABLE de-zoomcamp-2024.nytaxi.green_tripdata_non_partitoned AS
SELECT * FROM `de-zoomcamp-2024.nytaxi.green_tripdata_non_partitoned`;

-- Create a partitioned table from external table
CREATE OR REPLACE TABLE de-zoomcamp-2024.nytaxi.green_tripdata_partitoned
PARTITION BY
  DATE(lpep_pickup_datetime) AS
SELECT * FROM `de-zoomcamp-2024.nytaxi.green_tripdata_non_partitoned`;


-- Question 2
-- query to count the distinct number of PULocationIDs for the entire dataset on both the tables.
-- 0 B
SELECT COUNT(DISTINCT(PULocationID)) FROM `de-zoomcamp-2024.nytaxi.external_green_tripdata`;

-- query to count the distinct number of PULocationIDs for the entire dataset on both the tables.
-- 6.41 MB
SELECT COUNT(DISTINCT(PULocationID)) FROM `de-zoomcamp-2024.nytaxi.green_tripdata_non_partitoned`;


-- Question 3
-- How many records have a fare_amount of 0?
SELECT COUNT(*) FROM `de-zoomcamp-2024.nytaxi.external_green_tripdata`
WHERE fare_amount=0;

-- Question 4. What is the best strategy to make an optimized table in Big Query?

-- Question 5. 
-- Write a query to retrieve the distinct PULocationID between lpep_pickup_datetime 06/01/2022 and 06/30/2022 (inclusive)
-- Use the materialized table you created earlier in your from clause and note the estimated bytes. Now change the table in the from clause to the partitioned table you created for question 4 and note the estimated bytes processed. What are these values?
-- What's the size of the tables?


-- Scanning ~12.82 MB of DATA
SELECT DISTINCT(PULocationID)
FROM `de-zoomcamp-2024.nytaxi.green_tripdata_non_partitoned`
WHERE DATE(lpep_pickup_datetime) BETWEEN '2022-06-01' AND '2022-06-30';

-- Scanning ~1.12 MB of DATA
SELECT DISTINCT(PULocationID)
FROM `de-zoomcamp-2024.nytaxi.green_tripdata_partitoned`
WHERE DATE(lpep_pickup_datetime) BETWEEN '2022-06-01' AND '2022-06-30';


-- Q6 Where is the data stored in the External Table you created?

CREATE DATABASE lac_therapy_revenue;

USE lac_therapy_revenue;


-- creating table for revenue data

DROP TABLE IF EXISTS lac_revenue;

CREATE TABLE lac_revenue
(
date DATE,
cash DECIMAL (10, 2),
cash_pmt_count INT,
paper_check DECIMAL (10, 2),
check_pmt_count INT,
credit_debit DECIMAL (10, 2),
card_pmt_count INT,
total_revenue DECIMAL (10, 2),
total_pmt_count INT
);


-- verifying that all columns are present

SELECT *
FROM lac_revenue;


-- importing data into table

LOAD DATA INFILE 'lac_therapy_revenue.csv' INTO TABLE lac_revenue
FIELDS TERMINATED BY ','
IGNORE 1 LINES;


-- verifying that all data imported properly

SELECT *
FROM lac_revenue;
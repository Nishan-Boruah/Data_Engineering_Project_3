CREATE SCHEMA airlines;

CREATE TABLE airlines.airports_dim (
    airport_id BIGINT,
    city VARCHAR(100),
    state VARCHAR(100),
    name VARCHAR(200)
);

COPY airlines.airports_dim
FROM 's3://airlines-data-dim-raw/master-dim-table/airports.csv' 
IAM_ROLE 'arn:aws:iam::533267259001:role/redshift-role'
DELIMITER ','
IGNOREHEADER 1
REGION 'ap-south-1';

SELECT * FROM airlines.airports_dim LIMIT 2;

SELECT COUNT(*) FROM airlines.airports_dim;

CREATE TABLE airlines.daily_flights_fact (
    carrier VARCHAR(10),
    dep_airport VARCHAR(200),
    arr_airport VARCHAR(200),
    dep_city VARCHAR(100),
    arr_city VARCHAR(100),
    dep_state VARCHAR(100),
    arr_state VARCHAR(100),
    dep_delay BIGINT,
    arr_delay BIGINT
);

SELECT * FROM airlines.daily_flights_fact LIMIT 5;


/*Create new schema*/
CREATE SCHEMA government_spending;
USE government_spending;

/*Create table*/
CREATE TABLE gov_spend (
entity VARCHAR(100) NOT NULL,
code VARCHAR(5) NOT NULL,
year INT NOT NULL,
gov_expenditure NUMERIC NOT NULL
);

/*Load data from .csv file*/
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/historical-gov-spending-gdp.csv'
INTO TABLE gov_spend
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
--first dimension table
CREATE TABLE dim_dates(
date DATE NOT NULL
, year INT NOT NULL
, month INT NOT NULL
, day INT NOT NULL	
);

--second dimension table 
CREATE TABLE dim_renters(
renter_id INT PRIMARY KEY NOT NULL
, rentersName VARCHAR(255) NOT NULL
, rentersEmail TEXT NOT NULL
, rentersPhone VARCHAR(255) NOT NULL
);

--third dimension table 
CREATE TABLE dim_cars(
car_id INT PRIMARY KEY NOT NULL
, car_model VARCHAR(255) NOT NULL
, carCostPrice BIGINT NOT NULL
, pricePerHour INT NOT NULL	
);

--fourth dimension table
CREATE TABLE dim_car_status(
status_id INT PRIMARY KEY NOT NULL
, returnStatus VARCHAR NOT NULL
, isCarAvailForRent VARCHAR NOT NULL	
);

--fact table 
CREATE TABLE ft_car_renting (
id INT PRIMARY KEY NOT NULL
,renter_id INT REFERENCES dim_renters(renter_id)
, car_id INT REFERENCES dim_cars(car_id)
, status_id	INT REFERENCES dim_car_status(status_id)
, pickUpDate DATE NOT NULL
, returnDate DATE NOT NULL
, carRating FLOAT NOT NULL
, totalRentHours INT NOT NULL	
);


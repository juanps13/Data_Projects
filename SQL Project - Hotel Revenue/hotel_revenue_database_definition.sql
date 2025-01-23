/*Create database*/
CREATE SCHEMA hotel_revenue;
USE hotel_revenue;

/*Create tables*/
CREATE TABLE revenue_2018 (
	hotel VARCHAR(30),
	is_canceled BOOLEAN,
	lead_time INT,
	arrival_date_year INT,
	arrival_date_month VARCHAR(30),
	arrival_date_week_number INT,
	arrival_date_day_of_month INT,
	stays_in_weekend_nights INT,
	stays_in_week_nights INT,
	adults INT,
	children INT,
	babies INT,
	meal VARCHAR(50),
	country VARCHAR(3),
	market_segment VARCHAR(50),
	distribution_channel VARCHAR(50),
	is_repeated_guest BOOLEAN,
	previous_cancellations INT,
	previous_bookings_not_canceled INT,
	reserved_room_type VARCHAR(30),
	assigned_room_type VARCHAR(30),
	booking_changes INT,
	deposit_type VARCHAR(30),
	agent INT,
	company INT,
	days_in_waiting_list INT,
	customer_type VARCHAR(50),
	adr FLOAT,
	required_car_parking_spaces INT,
	total_of_special_requests INT,
	reservation_status VARCHAR(50),
	reservation_status_date DATE
);

CREATE TABLE revenue_2019 (
	hotel VARCHAR(30),
	is_canceled BOOLEAN,
	lead_time INT,
	arrival_date_year INT,
	arrival_date_month VARCHAR(30),
	arrival_date_week_number INT,
	arrival_date_day_of_month INT,
	stays_in_weekend_nights INT,
	stays_in_week_nights INT,
	adults INT,
	children INT,
	babies INT,
	meal VARCHAR(50),
	country VARCHAR(3),
	market_segment VARCHAR(50),
	distribution_channel VARCHAR(50),
	is_repeated_guest BOOLEAN,
	previous_cancellations INT,
	previous_bookings_not_canceled INT,
	reserved_room_type VARCHAR(30),
	assigned_room_type VARCHAR(30),
	booking_changes INT,
	deposit_type VARCHAR(30),
	agent INT,
	company INT,
	days_in_waiting_list INT,
	customer_type VARCHAR(50),
	adr FLOAT,
	required_car_parking_spaces INT,
	total_of_special_requests INT,
	reservation_status VARCHAR(50),
	reservation_status_date DATE
);

CREATE TABLE revenue_2020 (
	hotel VARCHAR(30),
	is_canceled BOOLEAN,
	lead_time INT,
	arrival_date_year INT,
	arrival_date_month VARCHAR(30),
	arrival_date_week_number INT,
	arrival_date_day_of_month INT,
	stays_in_weekend_nights INT,
	stays_in_week_nights INT,
	adults INT,
	children INT,
	babies INT,
	meal VARCHAR(50),
	country VARCHAR(3),
	market_segment VARCHAR(50),
	distribution_channel VARCHAR(50),
	is_repeated_guest BOOLEAN,
	previous_cancellations INT,
	previous_bookings_not_canceled INT,
	reserved_room_type VARCHAR(30),
	assigned_room_type VARCHAR(30),
	booking_changes INT,
	deposit_type VARCHAR(30),
	agent INT,
	company INT,
	days_in_waiting_list INT,
	customer_type VARCHAR(50),
	adr FLOAT,
	required_car_parking_spaces INT,
	total_of_special_requests INT,
	reservation_status VARCHAR(50),
	reservation_status_date DATE
);

CREATE TABLE meal_cost (
	cost FLOAT,
	meal VARCHAR(50) PRIMARY KEY
);

CREATE TABLE market_segment (
	discount FLOAT,
	segment VARCHAR(50) PRIMARY KEY
);

/*Add constraints*/
ALTER TABLE revenue_2018
ADD CONSTRAINT `foreign_key_2018_1` FOREIGN KEY (meal) REFERENCES meal_cost(meal) ON DELETE CASCADE,
ADD CONSTRAINT `foreign_key_2018_2` FOREIGN KEY (market_segment) REFERENCES market_segment(segment) ON DELETE CASCADE;

ALTER TABLE revenue_2019
ADD CONSTRAINT `foreign_key_2019_1` FOREIGN KEY (meal) REFERENCES meal_cost(meal) ON DELETE CASCADE,
ADD CONSTRAINT `foreign_key_2019_2` FOREIGN KEY (market_segment) REFERENCES market_segment(segment) ON DELETE CASCADE;

ALTER TABLE revenue_2020
ADD CONSTRAINT `foreign_key_2020_1` FOREIGN KEY (meal) REFERENCES meal_cost(meal) ON DELETE CASCADE,
ADD CONSTRAINT `foreign_key_2020_2` FOREIGN KEY (market_segment) REFERENCES market_segment(segment) ON DELETE CASCADE;


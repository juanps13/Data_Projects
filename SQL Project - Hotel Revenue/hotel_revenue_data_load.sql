/*Load data from .csv file*/
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/hotel_revenue_2018.csv'
INTO TABLE revenue_2018
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(hotel,
is_canceled,
lead_time,
arrival_date_year,
arrival_date_month,
arrival_date_week_number,
arrival_date_day_of_month,
stays_in_weekend_nights,
stays_in_week_nights,
adults,
@vchildren,
babies,
meal,
country,
market_segment,
distribution_channel,
is_repeated_guest,
previous_cancellations,
previous_bookings_not_canceled,
reserved_room_type,
assigned_room_type,
booking_changes,
deposit_type,
@vagent,
@vcompany,
days_in_waiting_list,
customer_type,
adr,
required_car_parking_spaces,
total_of_special_requests,
reservation_status,
reservation_status_date)
SET 
company = IF(@vcompany = '', NULL, @vcompany),
children = IF(@vchildren = '', NULL, @vchildren),
agent = IF(@vagent = '', NULL, @vagent);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/hotel_revenue_2019.csv'
INTO TABLE revenue_2019
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(hotel,
is_canceled,
lead_time,
arrival_date_year,
arrival_date_month,
arrival_date_week_number,
arrival_date_day_of_month,
stays_in_weekend_nights,
stays_in_week_nights,
adults,
@vchildren,
babies,
meal,
country,
market_segment,
distribution_channel,
is_repeated_guest,
previous_cancellations,
previous_bookings_not_canceled,
reserved_room_type,
assigned_room_type,
booking_changes,
deposit_type,
@vagent,
@vcompany,
days_in_waiting_list,
customer_type,
adr,
required_car_parking_spaces,
total_of_special_requests,
reservation_status,
reservation_status_date)
SET 
company = IF(@vcompany = '', NULL, @vcompany),
children = IF(@vchildren = '', NULL, @vchildren),
agent = IF(@vagent = '', NULL, @vagent);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/hotel_revenue_2020.csv'
INTO TABLE revenue_2020
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(hotel,
is_canceled,
lead_time,
arrival_date_year,
arrival_date_month,
arrival_date_week_number,
arrival_date_day_of_month,
stays_in_weekend_nights,
stays_in_week_nights,
adults,
@vchildren,
babies,
meal,
country,
market_segment,
distribution_channel,
is_repeated_guest,
previous_cancellations,
previous_bookings_not_canceled,
reserved_room_type,
assigned_room_type,
booking_changes,
deposit_type,
@vagent,
@vcompany,
days_in_waiting_list,
customer_type,
adr,
required_car_parking_spaces,
total_of_special_requests,
reservation_status,
reservation_status_date)
SET 
company = IF(@vcompany = '', NULL, @vcompany),
children = IF(@vchildren = '', NULL, @vchildren),
agent = IF(@vagent = '', NULL, @vagent);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/hotel_revenue_meal_cost.csv'
INTO TABLE meal_cost
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/hotel_revenue_market_segment.csv'
INTO TABLE market_segment
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;
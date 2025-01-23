/* --- PART 1 --- */
/* The main question we're trying to answer is if the total revenue is growing by year */

/* Query #1 - Revenue per year*/

WITH revenue_total AS (
SELECT * FROM revenue_2020
UNION
SELECT * FROM revenue_2019
UNION
SELECT * FROM revenue_2018)

SELECT 
	arrival_date_year, 
	ROUND(SUM((stays_in_weekend_nights + stays_in_week_nights)*adr),1) AS revenue
FROM revenue_total
GROUP BY arrival_date_year;

/* Apparently revenue increased in 2019 but decreased in 2020. 
However, there are some cancelled reservations, discunts, meal costs and other issues that should be included in the analysis.*/

/* Query #2 - Create View with all "revenue" tables, to facilitate the analysis*/

CREATE OR REPLACE VIEW v_revenue_total AS

SELECT * FROM revenue_2020
UNION
SELECT * FROM revenue_2019
UNION
SELECT * FROM revenue_2018
;

/*The first question we should ask is whether we have data for all three years or only for certain months." */

/* Query #3 - Explore years and months of the data */

SELECT DISTINCT
	arrival_date_year,
    arrival_date_month
FROM
	v_revenue_total;

 /* Given that we don't have complete data for 2018 and 2020 we will have to evaluate monthly data on a year-over-year basis */

/* Query #4 - Exploring if any "adr" is below 0 */

SELECT *
FROM v_revenue_total
WHERE adr < 0;

/* There is one, so we should exclude it from the analysis since probably it's a typo*/

/* Query #5 - Exploring the reservation statuses */

SELECT COUNT(reservation_status), reservation_status
FROM v_revenue_total
GROUP BY reservation_status;

/* There some rows as 'no show', we can assume that if there is any revenue from them is because they should be "Check Out"*/

/* Query #6 - Final monthly year-over-year revenue, discounting cost of meal, applying discount as of market segment 
and considering cancelations and "adr" issue*/

SELECT
    CONCAT(arrival_date_year, '_', arrival_date_month) AS date_ym,
    ROUND(SUM((stays_in_weekend_nights + stays_in_week_nights)*adr*(1-market_segment.discount)),1) AS pre_meal_revenue,
    ROUND(SUM(meal_cost.cost),2) AS cost_of_meal,
    ROUND(SUM((stays_in_weekend_nights + stays_in_week_nights)*adr*(1-market_segment.discount)) - SUM(meal_cost.cost),2) AS final_revenue
FROM v_revenue_total
LEFT JOIN market_segment
ON v_revenue_total.market_segment = market_segment.segment
LEFT JOIN meal_cost
ON v_revenue_total.meal = meal_cost.meal
WHERE is_canceled = 0 AND adr > 0
GROUP BY date_ym;

/* Earnings seem to be increasing year-over-year; with this table, a graph can be created to reflect this information clearly. */

/* --- PART 2 --- */

/* Another question that can be asked is which are the more profitable market segments
First, we will check which segment has more cancelation rate and then which is the most profitable. */

/* Query #7 - Identify market segments with more cancellation rates */

WITH revenue_total AS (
SELECT * FROM revenue_2020
UNION
SELECT * FROM revenue_2019
UNION
SELECT * FROM revenue_2018)

SELECT
    market_segment,
    COUNT(*) AS total_reserves,
    SUM(is_canceled) AS total_cancelations,
    ROUND(SUM(is_canceled) * 100.0 / COUNT(*), 2) AS cancel_rate
FROM revenue_total
GROUP BY market_segment
ORDER BY cancel_rate DESC;

/* Query #8 - Identify the more profitable market segments */

WITH revenue_total AS (
    SELECT 
        stays_in_weekend_nights,
        stays_in_week_nights,
        adr,
        market_segment,
        meal
    FROM revenue_2018
    WHERE is_canceled = 0
    UNION ALL
    SELECT 
        stays_in_weekend_nights,
        stays_in_week_nights,
        adr,
        market_segment,
        meal
    FROM revenue_2019
    WHERE is_canceled = 0
    UNION ALL
    SELECT 
        stays_in_weekend_nights,
        stays_in_week_nights,
        adr,
        market_segment,
        meal
    FROM revenue_2020
    WHERE is_canceled = 0
)

SELECT
    market_segment,
    COUNT(*) AS total_reserves,
    ROUND(SUM((stays_in_weekend_nights + stays_in_week_nights)*adr*(1-market_segment.discount)) - SUM(meal_cost.cost),2) AS final_revenue,
    ROUND((SUM((stays_in_weekend_nights + stays_in_week_nights)*adr*(1-market_segment.discount)) - SUM(meal_cost.cost)) / COUNT(*), 2) AS average_revenue
FROM revenue_total
LEFT JOIN market_segment
ON revenue_total.market_segment = market_segment.segment
LEFT JOIN meal_cost
ON revenue_total.meal = meal_cost.meal
GROUP BY market_segment
ORDER BY average_revenue DESC;

/* Query #9 - Number of adults, children and babies per hotel per year (assuming that if we don't have data for "children" or "babies" the number is 0) */
SELECT
	arrival_date_year,
    hotel,
	SUM(adults) AS adults,
    SUM(COALESCE(children,0)) AS children,
    SUM(COALESCE(babies,0)) AS babies
FROM v_revenue_total
GROUP BY arrival_date_year, hotel;
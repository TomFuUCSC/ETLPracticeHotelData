-- Author: Tom Fu
SELECT BOOKING_DATE, HOTEL, COST, AVG(COST) OVER (
ORDER BY BOOKING_DATE ROWS BETWEEN 29 PRECEDING AND CURRENT ROW)
 as "30_DAY_AVG_COST",
COST - AVG(COST) OVER (
ORDER BY BOOKING_DATE ROWS BETWEEN 29 PRECEDING AND CURRENT ROW) 
as "DIFF_BTW_ACTUAL_AVG"
FROM {{ ref('prepped_data') }}
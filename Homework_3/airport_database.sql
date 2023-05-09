SELECT
	id,
    price,
CASE
	WHEN price BETWEEN 10000 AND 11000
		THEN 'Economy'
	WHEN price BETWEEN 20000 AND 30000
		THEN 'PremiumEconomy'
	WHEN price > 100000
		THEN 'Business'
END AS service_class
FROM tickets;


SELECT
	side_number,
CASE
	WHEN production_year < 2000
		THEN 'Old'
	WHEN production_year BETWEEN 2000 AND 2010
		THEN 'Mid'
	ELSE 'New'
END AS age
FROM airliners
WHERE flight_range < 10000
ORDER BY age;


SELECT
	id,
    trip_id,
CASE
	WHEN service_class = 'Economy'
		THEN price * 0.85
	WHEN service_class = 'Business'
		THEN price * 0.90
	WHEN service_class = 'PremiumEconomy'
		THEN price * 0.80
END AS new_price
FROM tickets
WHERE trip_id IN ('LL4S1G8PQW', '0SE4S0HRRU', 'JQF04Q8I9G');

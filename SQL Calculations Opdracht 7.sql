SELECT 
	CountryName, 
	CASE
		WHEN ContinentID BETWEEN 1 AND 3	THEN 'Eurasia'
		WHEN ContinentID BETWEEN 5 AND 6	THEN 'Americas'
		WHEN ContinentID BETWEEN 2 AND 4	THEN 'Somewhere hot'
		WHEN ContinentID = 7			THEN 'Somewhere cold'
		ELSE					     'Eurasia'
	END AS 'CountryLocation' 
FROM tblCountry;
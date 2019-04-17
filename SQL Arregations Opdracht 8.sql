SELECT		YEAR(EventDate) / 100 + ''	AS 'Centrury',
		COUNT(EventName)		AS 'Number of Events'
FROM		tblEvent
GROUP BY	CUBE((YEAR(EventDate) / 100))
ORDER BY	Centrury;
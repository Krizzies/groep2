SELECT
	EventName,
	EventDate,
	FORMAT(EventDate, 'dddd')	AS 'Day of week',
	FORMAT(EventDate, 'dd')		AS 'Day Number'
FROM tblEvent
WHERE	(FORMAT(EventDate, 'dddd')	= 'Friday'		AND FORMAT(EventDate, 'dd')	= 13)
OR		(FORMAT(EventDate, 'dddd')	= 'Thursday'	AND FORMAT(EventDate, 'dd')	= 12)
OR		(FORMAT(EventDate, 'dddd')	= 'Saturday'	AND FORMAT(EventDate, 'dd')	= 14);
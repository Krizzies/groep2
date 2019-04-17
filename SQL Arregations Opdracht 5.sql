SELECT	COUNT(EventName)	AS	'Number of events',
	MAX(EventDate)		AS	'Last date',
	MIN(EventDate)		AS	'First Date'
FROM	tblEvent;
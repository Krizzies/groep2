SELECT 
	EventName, 
	EventDate AS NotFormatted,
	DATEDIFF(DAY, '2000-11-29', EventDate) AS 'Days offset',
	ABS(DATEDIFF(DAY, '2000-11-29', EventDate)) AS 'Days difference'
FROM tblEvent
ORDER BY ABS(DATEDIFF(DAY, '2000-11-29', EventDate));
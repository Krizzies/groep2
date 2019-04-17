SELECT 
	EventName, 
	EventDate AS NotFormatted,
	FORMAT(EventDate, 'dd/MM/yyyy') AS UsingFormat,
	CONVERT(VARCHAR, EventDate, 1) AS UsingConvert
FROM tblEvent 
WHERE	YEAR(EventDate) = 2000;
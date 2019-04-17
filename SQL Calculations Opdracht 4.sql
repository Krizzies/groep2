SELECT 
	EventDetails, 
	EventDate, 
	CHARINDEX('this', EventDetails, 1) As 'ThisPosition',
	CHARINDEX('that', EventDetails, 1) As 'ThatPosition' 
FROM tblEvent 
WHERE	EventDetails LIKE '%this%'
AND	EventDetails LIKE '%that%';
SELECT 
	EventName, 
	CASE
		WHEN EventName Like '[A,E,I,O,U]%' AND EventName Like '%[A,E,I,O,U]'		THEN	'Begins and Ends with a vowel'
		WHEN SUBSTRING(EventName, 1, 1) = SUBSTRING(EventName, LEN(EventName), 1)	THEN	'Begins and Ends with the same character'
	END AS 'Verdict' 
FROM tblEvent
WHERE	
	(EventName Like '[A,E,I,O,U]%' AND EventName Like '%[A,E,I,O,U]')
OR	SUBSTRING(EventName, 1, 1) = SUBSTRING(EventName, LEN(EventName), 1);
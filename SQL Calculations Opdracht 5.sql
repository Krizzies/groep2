SELECT 
	ContinentName, 
	Summary,
	ISNULL(Summary, 'No summary') AS 'Using ISNULL',
	COALESCE(Summary, 'No summary') AS 'Using COALESCE',CASE
    WHEN LEN(Summary) > 0 THEN Summary
    ELSE 'No summary'
	END AS 'Using Case'
FROM tblContinent;
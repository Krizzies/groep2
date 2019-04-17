--Select These fields
SELECT 
	tblCountry.CountryName AS Country, 
	tblEvent.EventName AS [What Happened], 
	tblEvent.EventDate AS [When happened] 
--From this table
FROM tblCountry 
--Join this table where the ID's are the same
INNER JOIN tblEvent 
	ON tblCountry.CountryID = tblEvent.CountryID 
--Order by Date ascending in alphabetical order
ORDER BY [When happened];
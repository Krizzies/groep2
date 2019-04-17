SELECT		EventName, 
		EventDate, 
		(SELECT CountryName FROM tblCountry WHERE CountryID = tblEvent.CountryID) AS 'CountryName'
FROM		tblEvent
WHERE		EventDate > (SELECT MAX(EventDate)FROM tblEvent WHERE CountryID = 21)
ORDER BY	EventDate DESC;
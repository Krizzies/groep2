SELECT	CountryName
FROM	tblCountry
WHERE	(SELECT COUNT(EventName) FROM tblEvent WHERE tblCountry.CountryID = tblEvent.CountryID) > 8;
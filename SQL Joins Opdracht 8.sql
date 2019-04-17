SELECT			CountryName
FROM			tblCountry
FULL OUTER JOIN		tblEvent	ON	tblCountry.CountryID = tblEvent.CountryID
GROUP BY		CountryName
HAVING			COUNT(tblEvent.EventName) = 0;
SELECT		ContinentName,
		EventName
FROM		tblEvent
INNER JOIN	tblCountry			ON	tblCountry.CountryID		=	tblEvent.CountryID
INNER JOIN	tblContinent			ON	tblContinent.ContinentID	=	tblCountry.ContinentID
GROUP BY	ContinentName,				EventName
HAVING		CONTINENTNAME			IN	(
		SELECT		TOP 3
				ContinentName
		FROM		tblEvent
		INNER JOIN	tblCountry	ON	tblCountry.CountryID		=	tblEvent.CountryID
		INNER JOIN	tblContinent	ON	tblContinent.ContinentID	=	tblCountry.ContinentID
		GROUP BY	ContinentName
		ORDER BY	COUNT(EventName)
);
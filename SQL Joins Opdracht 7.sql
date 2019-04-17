SELECT EventName, EventDate, CountryName, ContinentName
FROM		tblContinent
INNER JOIN	tblCountry		ON	tblContinent.ContinentID	=	tblCountry.ContinentID
INNER JOIN	tblEvent		ON	tblCountry.CountryID		=	tblEvent.CountryID
WHERE						ContinentName			=	'Antarctic'
OR						CountryName			=	'Russia';
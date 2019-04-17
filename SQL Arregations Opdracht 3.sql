SELECT		CategoryName,
		COUNT(EventName)	AS	'Number of events'
FROM		tblCategory
INNER JOIN	tblEvent		ON	tblCategory.CategoryID = tblEvent.CategoryID
GROUP BY	CategoryName
ORDER BY	COUNT(EventName)	DESC;
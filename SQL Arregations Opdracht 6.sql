SELECT		SUBSTRING(CategoryName, 1, 1)		AS	'Category Initial',
		COUNT(EventName)			AS	'Number Of Events',
		AVG(CONVERT(FLOAT, LEN(EventName)))	AS	'Average Event Name Length'
FROM		tblCategory
INNER JOIN	tblEvent				ON	tblCategory.CategoryID = tblEvent.CategoryID
GROUP BY	SUBSTRING(CategoryName, 1, 1)
ORDER BY	SUBSTRING(CategoryName, 1, 1);
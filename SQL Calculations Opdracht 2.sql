SELECT 
	Country, 
	KmSquared, 
	FLOOR(KmSquared / 20761) AS WalesUnits, 
	(KmSquared - (FLOOR(KmSquared / 20761) * 20761)) AS AreaLeftOver,
	CONCAT(FLOOR(KmSquared / 20761), ' x Wales plus ', (KmSquared - (FLOOR(KmSquared / 20761) * 20761)), 'sq. km. ') AS WalesComparison
FROM CountriesByArea 
ORDER BY (KmSquared - 20761);

--Mijn versie van SSMS heeft geen support voor het 'IF' commando
--Een nieuwe query met "SELECT IF(100>50, 'Yes', 'No')" geeft een error
--IF(FLOOR(KmSquared / 20761) > 1, CONCAT(FLOOR(KmSquared / 20761), ' x Wales plus ', (KmSquared - (FLOOR(KmSquared / 20761) * 20761)), 'sq. km. ') AS WalesComparison, 'Smaller than Wales' AS WalesComparison),
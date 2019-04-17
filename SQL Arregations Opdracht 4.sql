SELECT		YEAR(EpisodeDate)	AS	'Episode year',
		EnemyName,
		COUNT(EpisodeNumber)	AS	'Number of episodes'
FROM		tblEpisode
INNER JOIN	tblEpisodeEnemy		ON	tblEpisode.EpisodeId	= tblEpisodeEnemy.EpisodeId
INNER JOIN	tblEnemy		ON	tblEpisodeEnemy.EnemyId	= tblEnemy.EnemyId
INNER JOIN	tblDoctor		ON	tblEpisode.DoctorId	= tblDoctor.DoctorId
GROUP BY	YEAR(EpisodeDate),		EnemyName,		  BirthDate
HAVING		YEAR(BirthDate)		<	1970
AND		COUNT(EpisodeNumber)	>	1;
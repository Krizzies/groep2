SELECT		AuthorName,
		DoctorName,
		COUNT(EpisodeId)	AS	'Episodes'
FROM		tblAuthor 
INNER JOIN	tblEpisode			ON	tblAuthor.AuthorId	= tblEpisode.AuthorId 
INNER JOIN	tblDoctor			ON	tblEpisode.DoctorId	= tblDoctor.DoctorId
GROUP BY	AuthorName, 
		DoctorName
HAVING		COUNT(EpisodeId)	>	5;
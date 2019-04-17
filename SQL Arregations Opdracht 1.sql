SELECT
		AuthorName,
		COUNT(*)		AS	'Number Of Episodes',
		MIN(EpisodeDate)	AS	'First Episode Date',
		MAX(EpisodeDate)	AS	'Last Episode Date'
FROM		tblAuthor 
INNER JOIN	tblEpisode		ON	tblAuthor.AuthorId = tblEpisode.AuthorId
GROUP BY	AuthorName;
SELECT AuthorName, Title, DoctorName, EnemyName, Len(AuthorName + Title + DoctorName + EnemyName) AS 'Total Length' FROM tblAuthor
INNER JOIN tblEpisode		ON tblAuthor.AuthorId		 = tblEpisode.AuthorId
INNER JOIN tblDoctor		ON tblEpisode.DoctorId		 = tblDoctor.DoctorId
INNER JOIN tblEpisodeEnemy	ON tblEpisodeEnemy.EpisodeId = tblEpisode.EpisodeId
INNER JOIN tblEnemy			ON tblEpisodeEnemy.EnemyId	 = tblEnemy.EnemyId
WHERE Len(AuthorName + Title + DoctorName + EnemyName) < 40
GROUP BY AuthorName, Title, DoctorName, EnemyName;
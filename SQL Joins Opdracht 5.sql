SELECT DoctorName, Title FROM tblDoctor AS DoctorTable
INNER JOIN tblEpisode AS EpisodeTable ON DoctorTable.DoctorId = EpisodeTable.DoctorId
WHERE	DoctorName = 'Matt Smith'
AND	Year(EpisodeDate) = 2010;
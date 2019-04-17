SELECT EventName + ' (category' + CAST(CategoryID AS VARCHAR) + ')' AS 'Event (category)', EventDate FROM tblEvent WHERE CountryID = 1;

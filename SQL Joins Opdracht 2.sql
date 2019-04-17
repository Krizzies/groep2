SELECT tblEvent.EventName, tblEvent.EventDate, tblCategory.CategoryName FROM tblCategory INNER JOIN tblEvent ON tblEvent.CategoryID = tblCategory.CategoryID;

/* Error? */
SELECT tblEvent.EventName, tblEvent.EventDate, tblCategory.CategoryName FROM tblCategory OUTER JOIN tblEvent ON tblEvent.CategoryID = tblCategory.CategoryID;

/* Error? */
SELECT tblEvent.EventName, tblEvent.EventDate, tblCategory.CategoryName FROM tblCategory OUTER JOIN tblEvent ON tblEvent.CategoryID = tblCategory.CategoryID WHERE tblEvent.EventName = Null AND tblEvent.EventDate = Null;
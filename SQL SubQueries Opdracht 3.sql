SELECT	EventName
FROM	tblEvent
WHERE	LEN(EventName) < (SELECT AVG(LEN(EventName)) FROM tblEvent);
SELECT AVG(LEN(EventName)) FROM tblEvent;
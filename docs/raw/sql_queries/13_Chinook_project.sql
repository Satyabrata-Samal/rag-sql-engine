SELECT *
FROM chinook.actoralbum

SELECT *
FROM 
	chinook.artist


SELECT *
FROM 
	chinook.employee

SELECT *
FROM 
	chinook.genre


-- both have state in common

SELECT *
FROM 
	chinook.invoice

SELECT *
FROM 
	chinook.customer

SELECT *
FROM chinook.customer AS c
INNER JOIN chinook.invoice as il1 ON c.CustomerId = il1.CustomerId
INNER JOIN chinook.invoice as il2 ON c.State = il2.BillingState


DESCRIBE chinook.customer

DESCRIBE chinook.invoice





SELECT *
FROM 
	chinook.invoiceline


SELECT *
FROM 
	chinook.mediatype

SELECT *
FROM 
	chinook.playlist

SELECT *
FROM 
	chinook.playlisttrack

SELECT *
FROM 
	chinook.track

SELECT 
	t.*, 
	Ct.*,
	mt.Name AS Media_format
FROM 
	chinook.track AS t
INNER JOIN 
	chinook.playlisttrack AS Ct ON t.TrackId = Ct.TrackId
LEFT JOIN 
	chinook.mediatype AS mt ON t.MediaTypeId = mt.MediaTypeId;



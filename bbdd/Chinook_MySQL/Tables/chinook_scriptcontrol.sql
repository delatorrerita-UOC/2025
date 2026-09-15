SELECT 'album' as tabla, count(*) from album as registros
UNION
SELECT 'artist' as tabla, count(*) from artist as registros
UNION
SELECT 'employee' as tabla, count(*) from employee as registros
UNION
SELECT 'customer' as tabla, count(*) from customer as registros
UNION
SELECT 'genre' as tabla, count(*) from genre as registros
UNION
SELECT 'invoice' as tabla, count(*) from invoice as registros
UNION
SELECT 'invoiceline' as tabla, count(*) from invoiceline as registros
UNION
SELECT 'mediatype' as tabla, count(*) from mediatype as registros
UNION
SELECT 'playlist' as tabla, count(*) from playlist as registros
UNION
SELECT 'playlisttrack' as tabla, count(*) from playlisttrack as registros
UNION
SELECT 'track' as tabla, count(*) from track as registros;
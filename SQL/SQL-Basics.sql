SELECT 
		name AS trackName,
    ROUND(milliseconds / 60000.0, 2) AS minutes,
    ROUND(bytes/ (1024*1024.0), 4)   AS mb
FROM tracks;

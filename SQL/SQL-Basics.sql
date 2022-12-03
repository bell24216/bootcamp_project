SELECT 
    name AS trackName,
    ROUND(milliseconds / 60000.0, 2) AS minutes,
    ROUND(bytes/ (1024*1024.0), 4)   AS mb
FROM tracks;

-- outer query
SELECT 
	AVG(mb) AS avg_mb,
        SUM(mb) AS sum_mb,
        COUNT(mb) AS n_mb,
        COUNT(*)   AS n_row,
        MIN(mb) AS min_mb,
        MAX(mb) AS max_mb
FROM (
	-- inner query
	SELECT 
        bytes/ (1024*1024.0) AS mb
	FROM tracks
) AS sub;

-- Subquery / WITH (CTE)
WITH sub AS (
	SELECT * FROM customers
	WHERE UPPER(country) = 'USA'
)

SELECT 
    firstname, 
    state, 
    country, 
    email
FROM sub
WHERE state IN ('NY', 'CA');


SELECT 
    firstname, 
    state, 
    country, 
    email
FROM (
	SELECT * FROM customers
	WHERE UPPER(country) = 'USA'
) AS sub
WHERE state = 'NY' OR state = 'CA';




WITH invoice_y2010 AS (
		SELECT -- factInvoices
      invoicedate,
      STRFTIME('%Y%m', invoicedate) AS monthID,
      customerid, -- key
      total
    FROM invoices
    WHERE  STRFTIME('%Y', invoicedate) = '2010'
), usa_customers AS ( -- dimCustomers
		SELECT 
			customerid, -- key
			firstname, 
			lastname 
		FROM customers 
		WHERE country = 'USA'
)




SELECT 
    u.customerid, 
    u.firstname, 
    u.lastname, 
    ROUND(SUM(i.total),2) AS total_invoice
FROM usa_customers AS u
JOIN invoice_y2010 AS i ON u.customerid = i.customerid
GROUP BY u.customerid, u.firstname, u.lastname
ORDER BY SUM(i.total) DESC -- descending high to low



SELECT 
    u.customerid, 
    u.firstname, 
    u.lastname, 
    ROUND(SUM(i.total),2) AS total_invoice
FROM usa_customers AS u
JOIN invoice_y2010 AS i ON u.customerid = i.customerid
GROUP BY 1,2,3
ORDER BY 4 DESC -- descending high to low

--Business Requirements ⇒ SQL Queries
SELECT 
	segment, 
	SUM(revenue) AS total_revenue
FROM revenue_table
WHERE monthid = '202009'
GROUP BY segment
ORDER BY SUM(revenue) DESC
LIMIT 3;

--CASE WHEN + Subquery
SELECT 
	region,
	COUNT(*) AS n_sub
FROM (
	SELECT 
		country,
    CASE 
    	WHEN country IN ('USA', 'Canada') THEN 'North America'
			WHEN country IN ('Brazil') THEN 'South America'
      WHEN country IN ('Italy', 'Belgium', 'Germany', 'Denmark', 'Portugal') THEN 'Europe'
    	ELSE 'Other Regions'
    END AS region
	FROM customers
) AS sub
GROUP BY 1
ORDER BY 2 DESC -- descending order high to low

-- refactor using WITH clause
WITH sub AS (
	SELECT 
		country,
    CASE 
    	WHEN country IN ('USA', 'Canada') THEN 'North America'
			WHEN country IN ('Brazil') THEN 'South America'
      WHEN country IN ('Italy', 'Belgium', 'Germany', 'Denmark', 'Portugal') THEN 'Europe'
    	ELSE 'Other Regions'
    END AS region
	FROM customers
)

SELECT 
	region,
	COUNT(*) AS n_sub
FROM sub
GROUP BY 1
ORDER BY 2 DESC


--Clean NULL
SELECT 
		firstname, 
    company,
    COALESCE(company, 'End Customer') AS clean_company,
    CASE
	    	WHEN company IS NULL THEN 'Customer'
        ELSE 'Corporate'
    END AS segment
FROM customers

--JOIN 4 Tables
SELECT 
	genre_name,
	COUNT(*) AS n_tracks
FROM (
	SELECT
			ar.name AS artist_name,
			al.title,
		  tr.name AS track_name,
		  tr.milliseconds,
		  tr.bytes,
		  ge.name AS genre_name
	FROM artists ar 
	JOIN albums  al ON ar.artistid = al.artistid
	JOIN tracks  tr ON tr.albumid  = al.albumid
	JOIN genres  ge ON ge.genreid  = tr.genreid
	WHERE ge.name <> 'Jazz' -- OKAY
) AS sub
GROUP BY genre_name
-- genre songs more than 100
HAVING COUNT(*) > 100  
ORDER BY COUNT(*) DESC


-- create view (Virtual Table)
CREATE VIEW full_table AS
		SELECT
					ar.name AS artist_name,
					al.title,
				  tr.name AS track_name,
				  tr.milliseconds,
				  tr.bytes,
				  ge.name AS genre_name
		FROM artists ar 
		JOIN albums  al ON ar.artistid = al.artistid
		JOIN tracks  tr ON tr.albumid  = al.albumid
		JOIN genres  ge ON ge.genreid  = tr.genreid;

--CREATE
CREATE VIEW us_uk_customers AS 
  SELECT * FROM customers 
  WHERE country = 'USA'
  UNION -- remove duplicates
  SELECT * FROM customers 
  WHERE country = 'United Kingdom';
  
SELECT COUNT(*) FROM us_uk_customers;







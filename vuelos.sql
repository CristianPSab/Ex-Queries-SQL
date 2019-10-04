
# Consultes SQL:

# 1)
SELECT COUNT(*)
FROM usairlineflights2.flights;

# 2)
SELECT origin, AVG(ArrDelay) AS prom_arribades, AVG(DepDelay) AS prom_sortides
FROM usairlineflights2.flights
group by origin;

# 3)
SELECT origin, colYear, colMonth, AVG(ArrDelay) AS prom_arribades 
FROM usairlineflights2.flights
group by origin, colYear, colMonth
order by origin, colYear, colMonth;

# 4)
SELECT  b.City , a.colYear , a.colMonth, AVG(a.ArrDelay) AS prom_arribades 
FROM usairlineflights2.usairports AS  b 
	right join usairlineflights2.flights AS a
     on b.IATA = a.origin
group by a.origin, a.colYear, a.colMonth
order by b.City, a.colYear, a.colMonth;

# 5)
SELECT UniqueCarrier, colYear, colMonth, AVG(arrDelay) AS AVG_delay, SUM(Cancelled) AS total_cancelled
FROM usairlineflights2.flights
group by UniqueCarrier, colYear, colMonth
order by SUM(Cancelled) desc;
  
# 6)
SELECT TailNum, SUM(Distance) as totalDistance
FROM `flights`
WHERE tailNum <> ''
GROUP BY TailNum
ORDER BY SUM(Distance) desc
LIMIT 10;


# 7)
SELECT  UniqueCarrier, AVG(ArrDelay ) AS AvgDelay
FROM  usairlineflights2.flights
GROUP BY UniqueCarrier
HAVING AVG(ArrDelay) > 10
ORDER BY AVG(ArrDelay) DESC;

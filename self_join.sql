--1
SELECT COUNT(*) FROM stops;
--2
SELECT id FROM stops WHERE name='Craiglockhart';
--3
SELECT id, name
FROM stops
JOIN route ON stops.id = route.stop
WHERE num = 4
AND company = 'LRT';
--4
SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*) = 2;
--5
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop=149;
--6
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name='London Road';
--7
SELECT DISTINCT a.company, a.num
FROM route a
JOIN route b ON a.num = b.num
WHERE a.stop = 115
AND b.stop = 137;
--8
SELECT a.company, a.num
FROM route a
JOIN route b ON (a.num = b.num)
JOIN stops stopa ON (a.stop = stopa.id)
JOIN stops stopb ON (b.stop = stopb.id)
WHERE stopa.name = 'Craiglockhart'
AND stopb.name = 'Tollcross';
--9
SELECT DISTINCT stopb.name, b.company, b.num
FROM route a
JOIN route b ON (a.num = b.num AND a.company = b.company)
JOIN stops stopa ON (a.stop = stopa.id)
JOIN stops stopb ON (b.stop = stopb.id)
WHERE stopa.name = 'Craiglockhart';
--10
SELECT DISTINCT c.num, c.company, s3.name, d.num, d.company
FROM route a, route b, route c, route d, stops s1, stops s2, stops s3, stops s4
WHERE a.stop=s1.id AND b.stop=s2.id AND c.stop=s3.id AND d.stop=s4.id
AND s1.name='Craiglockhart' AND s2.name='Lochend'
AND a.num=c.num AND b.num=d.num
AND a.company=c.company AND b.company=d.company
AND c.stop=d.stop
ORDER BY a.num,name,b.num;
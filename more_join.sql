--1
SELECT id, title
 FROM movie
 WHERE yr=1962;
 --2
 SELECT yr FROM movie WHERE title='Citizen Kane';
 --3
 SELECT id, title, yr FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr;
--4
SELECT id FROM actor WHERE name = 'Glenn Close';
--5
SELECT id FROM movie WHERE title = 'Casablanca';
--6
SELECT name FROM casting JOIN actor ON actorid=id WHERE movieid=11768 ;
--7
SELECT name FROM casting 
JOIN actor ON actorid=id 
JOIN movie on movie.id=movieid WHERE title='Alien' ;
--8
SELECT title FROM casting 
JOIN actor ON actorid=id 
JOIN movie on movie.id=movieid WHERE name='Harrison Ford' ;
--9
SELECT title FROM casting 
JOIN actor ON actorid=id 
JOIN movie on movie.id=movieid WHERE name='Harrison Ford' AND ord <>1;
--10
SELECT title, name FROM casting 
JOIN actor ON actorid=id 
JOIN movie on movie.id=movieid WHERE yr=1962 AND ord =1;
--11
SELECT yr, COUNT(title) as number_of_movies FROM
    movie JOIN casting ON movie.id=movieid
          JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 1
ORDER BY COUNT(title) DESC
LIMIT 2;
--12
SELECT title, name 
FROM movie
JOIN casting ON movie.id=movieid
JOIN actor   ON actorid=actor.id
WHERE ord = 1 AND movieid IN 
( SELECT movieid 
FROM casting JOIN actor
ON actorid = actor.id
WHERE name = 'Julie Andrews') ;
--13
SELECT name
FROM actor JOIN casting
ON id = actorid
AND ord = 1
GROUP BY name
HAVING COUNT(name) >= 15;
--14
SELECT title, COUNT(actorid) as cast
FROM movie JOIN casting on id=movieid
WHERE yr = 1978
GROUP BY title
ORDER BY cast DESC, title;
--15
SELECT distinct actor.name
FROM movie
JOIN casting
ON casting.movieid = movie.id
JOIN actor
ON actor.id = casting.actorid
WHERE movie.id IN (SELECT movieid FROM casting JOIN actor ON id =actorid WHERE 
actor.name = 'Art Garfunkel') AND actor.name <> 'Art Garfunkel'
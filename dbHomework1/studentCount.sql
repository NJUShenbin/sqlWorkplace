SELECT slt.sid,sum(slt.score) FROM `select` slt
WHERE sid = 2481
GROUP BY slt.sid;

SELECT slt.sid,sum(slt.score) FROM `select` slt
WHERE sid = 6413
GROUP BY slt.sid;

SELECT s.sid , s.name , sum(slt.score)
FROM student s, `select` slt
WHERE s.sid=slt.sid
      AND
  s.sid=6413
  AND

  slt.year >= ALL(
    SELECT slt2.year FROM `select` slt2
    WHERE slt2.sid = slt.sid AND slt2.cid=slt.cid
  )
GROUP BY slt.sid,s.sid ,s.name
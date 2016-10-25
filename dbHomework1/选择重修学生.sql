USE cms;

SELECT s.sid,s.name,s.grade,c.cid,c.name,slt.year,slt.score
FROM student s,`select` slt,course c
WHERE s.sid=slt.sid AND c.cid = slt.cid AND
      exists(
  SELECT s2.sid,s2.cid
  FROM `select` s2
  WHERE sid=s.sid AND s2.cid=c.cid
  GROUP BY s2.sid,s2.cid HAVING count(*)>=2
)
ORDER BY sid



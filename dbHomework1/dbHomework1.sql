#1.c查询2013级学生的总分排名，并按照总分降序排序（考虑重修以最新成绩为准）
SELECT s.sid AS studentId, s.name AS studentName, sum(slt.score) AS totalScore
FROM student s, `select` slt
WHERE s.sid=slt.sid
      AND
  s.grade=2013
  AND
  slt.year >= ALL(
    SELECT slt2.year FROM `select` slt2
    WHERE slt2.sid = slt.sid AND slt2.cid=slt.cid
  )
GROUP BY slt.sid,s.sid ,s.name
ORDER BY sum(slt.score) DESC


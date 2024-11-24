Row numbering can also be used for ranking. For example, numbering rows and ordering by the count of medals each athlete earned in the OVER clause will assign 1 
  to the highest-earning medalist, 2 to the second highest-earning medalist, and so on.


One of the ways of using window functions with CTEs is using 
1 a CTE for getting the wanted data - with group by/aggregation functions.
2.a CTE for WF.




WITH Athlete_Medals AS (
  SELECT
    -- Count the number of medals each athlete has earned
    Athlete,
    COUNT(*) AS Medals
  FROM Summer_Medals
  GROUP BY Athlete)

SELECT
  -- Number each athlete by how many medals they've earned
  athlete,
  row_number() OVER (ORDER BY Medals DESC) AS Row_N
FROM Athlete_Medals
ORDER BY Medals DESC;

Reigning weightlifting champions
A reigning champion is a champion whos won both the previous and current years competitions. To determine if a champion is reigning, the previous and current years
  results need to be in the same row, in two different columns.

Having wrapped the previous query in the Weightlifting_Gold CTE, get the previous years champion for each year.

----------------
  
WITH Weightlifting_Gold AS (
  SELECT
    -- Return each year's champions' countries
    Year,
    Country AS champion
  FROM Summer_Medals
  WHERE
    Discipline = 'Weightlifting' AND
    Event = '69KG' AND
    Gender = 'Men' AND
    Medal = 'Gold'
)

SELECT
  Year, Champion,
  -- Fetch the previous year's champion
  lag(Champion) OVER
    (order by year ASC) AS Last_Champion
FROM Weightlifting_Gold
ORDER BY Year ASC;

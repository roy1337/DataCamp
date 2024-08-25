Mean imputation
Create a stored procedure that will apply mean imputation to the YellowTripData records with an incorrect TripDistance of zero. The average trip distance variable should have a precision of 18 and 4 decimal places.


-- Create the stored procedure
create procedure dbo.cuspImputeTripDistanceMean 
AS
BEGIN
-- Specify @AvgTripDistance variable
declare @AvgTripDistance AS numeric (18,4)

-- Calculate the average trip distance
SELECT @AvgTripDistance = avg(TripDistance)
FROM YellowTripData
-- Only include trip distances greater than 0
where TripDistance > 0

-- Update the records where trip distance is 0
update YellowTripData
set TripDistance = @AvgTripDistance
where TripDistance = 0
END;
